﻿/*
===========================================================================

Copyright (c) 2018 Darkstar Dev Teams

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#include "trustentity.h"
#include "../ai/ai_container.h"
#include "../ai/controllers/trust_controller.h"
#include "../ai/helpers/pathfind.h"
#include "../ai/helpers/targetfind.h"
#include "../ai/states/ability_state.h"
#include "../ai/states/attack_state.h"
#include "../ai/states/magic_state.h"
#include "../ai/states/mobskill_state.h"
#include "../ai/states/range_state.h"
#include "../ai/states/weaponskill_state.h"
#include "../attack.h"
#include "../mob_spell_container.h"
#include "../mob_spell_list.h"
#include "../packets/char_health.h"
#include "../packets/entity_set_name.h"
#include "../packets/entity_update.h"
#include "../packets/trust_sync.h"
#include "../recast_container.h"
#include "../status_effect_container.h"
#include "../utils/battleutils.h"
#include "../utils/trustutils.h"

CTrustEntity::CTrustEntity(CCharEntity* PChar)
{
    objtype        = TYPE_TRUST;
    m_EcoSystem    = SYSTEM_UNCLASSIFIED;
    allegiance     = ALLEGIANCE_PLAYER;
    m_MobSkillList = 0;
    PMaster        = PChar;
    PAI            = std::make_unique<CAIContainer>(this, std::make_unique<CPathFind>(this), std::make_unique<CTrustController>(PChar, this),
	                                     std::make_unique<CTargetFind>(this));
}

void CTrustEntity::PostTick()
{
	// NOTE: This is purposefully calling CBattleEntity's impl.
    // TODO: Calling a grand-parent's impl. of an overrideden function is bad
    CBattleEntity::PostTick();
    if (loc.zone && updatemask && status != STATUS_DISAPPEAR)
    {
        loc.zone->PushPacket(this, CHAR_INRANGE, new CEntityUpdatePacket(this, ENTITY_UPDATE, updatemask));

        if (PMaster && PMaster->PParty && updatemask & UPDATE_HP)
        {
            PMaster->ForParty([this](auto PMember) { static_cast<CCharEntity*>(PMember)->pushPacket(new CCharHealthPacket(this)); });
        }
        updatemask = 0;
    }
}

void CTrustEntity::FadeOut()
{
    CBaseEntity::FadeOut();
    loc.zone->PushPacket(this, (loc.zone->m_BattlefieldHandler) ? CHAR_INZONE : CHAR_INRANGE, new CEntityUpdatePacket(this, ENTITY_DESPAWN, UPDATE_NONE));
}

void CTrustEntity::Die()
{
    luautils::OnMobDeath(this, nullptr);
    PAI->ClearStateStack();
    PAI->Internal_Die(0s);
    ((CCharEntity*)PMaster)->RemoveTrust(this);
	
	// NOTE: This is purposefully calling CBattleEntity's impl.
    // TODO: Calling a grand-parent's impl. of an overrideden function is bad
    CBattleEntity::Die();
}

void CTrustEntity::Spawn()
{
    // NOTE: This is purposefully calling CBattleEntity's impl.
    // TODO: Calling a grand-parent's impl. of an overrideden function is bad
    // we need to skip CMobEntity's spawn because it calculates stats (and our stats are already calculated)
    CBattleEntity::Spawn();
    luautils::OnMobSpawn(this);
    ((CCharEntity*)PMaster)->pushPacket(new CTrustSyncPacket((CCharEntity*)PMaster, this));
}

void CTrustEntity::OnAbility(CAbilityState& state, action_t& action)
{
    auto PAbility = state.GetAbility();
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    std::unique_ptr<CBasicPacket> errMsg;
    if (IsValidTarget(PTarget->targid, PAbility->getValidTarget(), errMsg))
    {
        if (this != PTarget && distance(this->loc.p, PTarget->loc.p) > PAbility->getRange())
        {
            return;
        }

        if (battleutils::IsParalyzed(this))
        {
            loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_IS_PARALYZED));
            return;
        }

        if (this->StatusEffectContainer->HasStatusEffect(EFFECT_AMNESIA))
        {
            return;
        }

        action.id                    = this->id;
        action.actiontype            = PAbility->getActionType();
        action.actionid              = PAbility->getID();
        action.recast                = PAbility->getRecastTime();
		
        if (PAbility->isAoE())
        {
            PAI->TargetFind->reset();

            float distance = PAbility->getRange();

            PAI->TargetFind->findWithinArea(this, AOERADIUS_ATTACKER, distance);

            uint16 msg = 0;
            for (auto&& PTarget : PAI->TargetFind->m_targets)
            {
                actionList_t& actionList     = action.getNewActionList();
                actionList.ActionTargetID    = PTarget->id;
                actionTarget_t& actionTarget = actionList.getNewActionTarget();
                actionTarget.reaction        = REACTION_NONE;
                actionTarget.speceffect      = SPECEFFECT_NONE;
                actionTarget.animation       = PAbility->getAnimationID();
                actionTarget.messageID       = PAbility->getMessage();

                if (msg == 0)
                {
                    msg = PAbility->getMessage();
                }
                else
                {
                    msg = PAbility->getAoEMsg();
                }

                if (actionTarget.param < 0)
                {
                    msg                = ability::GetAbsorbMessage(msg);
                    actionTarget.param = -actionTarget.param;
                }

                actionTarget.messageID = msg;
                actionTarget.param     = luautils::OnUseAbility(this, PTarget, PAbility, &action);
            }
        }
        else
        {
            actionList_t& actionList     = action.getNewActionList();
            actionList.ActionTargetID    = PTarget->id;
            actionTarget_t& actionTarget = actionList.getNewActionTarget();
            actionTarget.reaction        = REACTION_NONE;
            actionTarget.speceffect      = SPECEFFECT_RECOIL;
            actionTarget.animation       = PAbility->getAnimationID();
            actionTarget.param           = 0;
            auto prevMsg                 = actionTarget.messageID;

            int32 value = luautils::OnUseAbility(this, PTarget, PAbility, &action);
            if (prevMsg == actionTarget.messageID)
            {
                actionTarget.messageID = PAbility->getMessage();
            }
            if (actionTarget.messageID == 0)
            {
                actionTarget.messageID = MSGBASIC_USES_JA;
            }
            actionTarget.param = value;

            if (value < 0)
            {
                actionTarget.messageID = ability::GetAbsorbMessage(actionTarget.messageID);
                actionTarget.param     = -value;
            }
        }

        state.ApplyEnmity();

        PRecastContainer->Add(RECAST_ABILITY, action.actionid, action.recast);
    }
}

void CTrustEntity::OnRangedAttack(CRangeState& state, action_t& action)
{
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    int32 damage      = 0;
    int32 totalDamage = 0;

    action.id         = id;
    action.actiontype = ACTION_RANGED_FINISH;

    actionList_t& actionList  = action.getNewActionList();
    actionList.ActionTargetID = PTarget->id;

    actionTarget_t& actionTarget = actionList.getNewActionTarget();
    actionTarget.reaction        = REACTION_HIT;		//0x10
    actionTarget.speceffect      = SPECEFFECT_HIT;		//0x60 (SPECEFFECT_HIT + SPECEFFECT_RECOIL)
    actionTarget.messageID       = 352;

	uint8 mLvl         = this->GetMLevel();
    uint8 slot         = SLOT_RANGED;
    uint8 shadowsTaken = 0;
    uint8 hitCount     = 1;			// 1 hit by default
    uint8 realHits     = 0;			// to store the real number of hit for tp multipler
    auto ammoConsumed  = 0;
    bool hitOccured    = false;	// track if player hit mob at all
    bool isBarrage     = StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE, 0);

    // If barrage is detected add shots based on level
    if (isBarrage)
    {
        if (mLvl < 30)
		{
			hitCount = 3;
		}
		else if (mLvl < 50)
		{
			hitCount = 4;
		}
		else if (mLvl < 75)
		{
			hitCount = 5;
		}
		else if (mLvl < 90)
		{
			hitCount = 6;
		}
		else if (mLvl < 99)
		{
			hitCount = 7;
		}
		else if (mLvl >= 99)
		{
			hitCount = 8;
		}
    }

    // loop for barrage hits, if a miss occurs, the loop will end
    for (uint8 i = 1; i <= hitCount; ++i)
    {
        if (PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE, 0))
        {
            actionTarget.messageID  = 32;
            actionTarget.reaction   = REACTION_EVADE;
            actionTarget.speceffect = SPECEFFECT_NONE;
            hitCount                = i; // end barrage, shot missed
        }
        else if (tpzrand::GetRandomNumber(100) < battleutils::GetRangedHitRate(this, PTarget, isBarrage)) // hit!
        {
            // absorbed by shadow
            if (battleutils::IsAbsorbByShadow(PTarget))
            {
                shadowsTaken++;
            }
            else
            {
                bool isCritical = tpzrand::GetRandomNumber(100) < battleutils::GetCritHitRate(this, PTarget, true);
                float pdif      = battleutils::GetRangedDamageRatio(this, PTarget, isCritical);

                if (isCritical)
                {
                    actionTarget.speceffect = SPECEFFECT_CRITICAL_HIT;
                    actionTarget.messageID  = 353;
                }

                // at least 1 hit occured
                hitOccured = true;
                realHits++;

                damage = (int32)((this->GetRangedWeaponDmg() + battleutils::GetFSTR(this, PTarget, slot)) * pdif);
            }
        }
        else //miss
        {
            actionTarget.reaction   = REACTION_EVADE;
            actionTarget.speceffect = SPECEFFECT_NONE;
            actionTarget.messageID  = 354;
            hitCount                = i; // end barrage, shot missed
        }

        totalDamage += damage;
    }

    // if a hit did occur (even without barrage)
    if (hitOccured == true)
    {
        // any misses with barrage cause remaining shots to miss, meaning we must check Action.reaction
        if (actionTarget.reaction == REACTION_EVADE && (this->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE)))
        {
            actionTarget.messageID  = 352;
            actionTarget.reaction   = REACTION_HIT;
            actionTarget.speceffect = SPECEFFECT_CRITICAL_HIT;
        }
		
		if (this->StatusEffectContainer->HasStatusEffect(EFFECT_DOUBLE_SHOT) && tpzrand::GetRandomNumber(100) < this->getMod(Mod::DOUBLE_SHOT_RATE) && realHits == 1)
		{
			totalDamage = totalDamage * 2;
			realHits    = 2;
		}
		else if (this->StatusEffectContainer->HasStatusEffect(EFFECT_TRIPLE_SHOT) && tpzrand::GetRandomNumber(100) < this->getMod(Mod::TRIPLE_SHOT_RATE) && realHits == 1)
		{
			totalDamage = totalDamage * 3;
			realHits    = 3;
		}

        actionTarget.param = battleutils::TakePhysicalDamage(this, PTarget, PHYSICAL_ATTACK_TYPE::RANGED, totalDamage, false, slot, realHits, nullptr, true, true);

        // lower damage based on shadows taken
        if (shadowsTaken)
        {
            actionTarget.param = (int32)(actionTarget.param * (1 - ((float)shadowsTaken / realHits)));
        }

        // absorb message
        if (actionTarget.param < 0)
        {
            actionTarget.param     = -(actionTarget.param);
            actionTarget.messageID = 382;
        }
    }
    else if (shadowsTaken > 0)
    {
        // shadows took damage
        actionTarget.messageID = 0;
        actionTarget.reaction  = REACTION_EVADE;
        PTarget->loc.zone->PushPacket(PTarget, CHAR_INRANGE_SELF, new CMessageBasicPacket(PTarget, PTarget, 0, shadowsTaken, MSGBASIC_SHADOW_ABSORB));
    }

    if (actionTarget.speceffect == SPECEFFECT_HIT && actionTarget.param > 0)
	{
        actionTarget.speceffect = SPECEFFECT_RECOIL;
	}

    // remove barrage effect if present
    if (this->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE, 0))
	{
        StatusEffectContainer->DelStatusEffect(EFFECT_BARRAGE, 0);
    }
	
    battleutils::ClaimMob(PTarget, this);
	
    // only remove detectables
    StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);
}

bool CTrustEntity::ValidTarget(CBattleEntity* PInitiator, uint16 targetFlags)
{
    if (PInitiator->objtype == TYPE_TRUST && PMaster == PInitiator->PMaster)
    {
        return true;
    }

    if ((targetFlags & TARGET_PLAYER_PARTY_PIANISSIMO) && PInitiator->allegiance == allegiance && PMaster && PInitiator != this)
    {
        return true;
    }

    if (targetFlags & TARGET_PLAYER_PARTY && PInitiator->allegiance == allegiance && PMaster)
    {
        return PInitiator->PParty == PMaster->PParty;
    }

    return CMobEntity::ValidTarget(PInitiator, targetFlags);
}

void CTrustEntity::OnDespawn(CDespawnState&)
{
    if (GetHPP() > 0)
    {
        // Don't call this when despawning after being killed
        luautils::OnMobDespawn(this);
    }
    FadeOut();
    PAI->EventHandler.triggerListener("DESPAWN", this);
}


void CTrustEntity::OnCastFinished(CMagicState& state, action_t& action)
{
	// NOTE: This is purposefully calling CBattleEntity's impl.
    // TODO: Calling a grand-parent's impl. of an overrideden function is bad
    CBattleEntity::OnCastFinished(state, action);

    auto PSpell = state.GetSpell();

    PRecastContainer->Add(RECAST_MAGIC, static_cast<uint16>(PSpell->getID()), action.recast);
}

void CTrustEntity::OnMobSkillFinished(CMobSkillState& state, action_t& action)
{
    CMobEntity::OnMobSkillFinished(state, action);
}

void CTrustEntity::OnWeaponSkillFinished(CWeaponSkillState& state, action_t& action)
{
	// NOTE: This is purposefully calling CBattleEntity's impl.
    // TODO: Calling a grand-parent's impl. of an overrideden function is bad
    CBattleEntity::OnWeaponSkillFinished(state, action);

    auto PWeaponSkill  = state.GetSkill();
    auto PBattleTarget = static_cast<CBattleEntity*>(state.GetTarget());

    int16 tp = state.GetSpentTP();
    tp       = battleutils::CalculateWeaponSkillTP(this, PWeaponSkill, tp);

    if (distance(loc.p, PBattleTarget->loc.p) - PBattleTarget->m_ModelSize <= PWeaponSkill->getRange())
    {
        PAI->TargetFind->reset();
        if (PWeaponSkill->isAoE())
        {
            PAI->TargetFind->findWithinArea(PBattleTarget, AOERADIUS_TARGET, 10);
        }
        else
        {
            PAI->TargetFind->findSingleTarget(PBattleTarget);
        }

        for (auto&& PTarget : PAI->TargetFind->m_targets)
        {
            bool primary              = PTarget == PBattleTarget;
            actionList_t& actionList  = action.getNewActionList();
            actionList.ActionTargetID = PTarget->id;

            actionTarget_t& actionTarget = actionList.getNewActionTarget();

            uint16         tpHitsLanded;
            uint16         extraHitsLanded;
            int32          damage;
            CBattleEntity* taChar = battleutils::getAvailableTrickAttackChar(this, PTarget);

            actionTarget.reaction                           = REACTION_NONE;
            actionTarget.speceffect                         = SPECEFFECT_NONE;
            actionTarget.animation                          = PWeaponSkill->getAnimationId();
            actionTarget.messageID                          = 0;
            std::tie(damage, tpHitsLanded, extraHitsLanded) = luautils::OnUseWeaponSkill(this, PTarget, PWeaponSkill, tp, primary, action, taChar);

            if (!battleutils::isValidSelfTargetWeaponskill(PWeaponSkill->getID()))
            {
                if (primary && PBattleTarget->objtype == TYPE_MOB)
                {
                    luautils::OnWeaponskillHit(PBattleTarget, this, PWeaponSkill->getID());
                }
            }
            else // Self-targetting WS restoring MP
            {
                actionTarget.messageID = primary ? 224 : 276; // Restores mp msg
                actionTarget.reaction  = REACTION_HIT;
                damage                 = std::max(damage, 0);
                actionTarget.param     = addMP(damage);
            }

            if (primary)
            {
                if (PWeaponSkill->getPrimarySkillchain() != 0)
                {
                    // NOTE: GetSkillChainEffect is INSIDE this if statement because it
                    //  ALTERS the state of the resonance, which misses and non-elemental skills should NOT do.
                    SUBEFFECT effect = battleutils::GetSkillChainEffect(PBattleTarget, PWeaponSkill->getPrimarySkillchain(), PWeaponSkill->getSecondarySkillchain(), PWeaponSkill->getTertiarySkillchain());
                    if (effect != SUBEFFECT_NONE)
                    {
                        actionTarget.addEffectParam = battleutils::TakeSkillchainDamage(this, PBattleTarget, damage, taChar);
                        if (actionTarget.addEffectParam < 0)
                        {
                            actionTarget.addEffectParam   = -actionTarget.addEffectParam;
                            actionTarget.addEffectMessage = 384 + effect;
                        }
                        else
                        {
                            actionTarget.addEffectMessage = 287 + effect;
                        } 
                        actionTarget.additionalEffect = effect;
                    }
                }
            }
        }
    }
    else
    {
        actionList_t& actionList  = action.getNewActionList();
        actionList.ActionTargetID = PBattleTarget->id;
        action.actiontype         = ACTION_MAGIC_FINISH; // all "too far" messages use cat 4

        actionTarget_t& actionTarget = actionList.getNewActionTarget();
        actionTarget.animation       = 0x1FC; // seems hardcoded, 2 bits away from 0x1FF.
        actionTarget.messageID       = MSGBASIC_TOO_FAR_AWAY;

        actionTarget.speceffect = SPECEFFECT_NONE; // It seems most mobs use NONE, but player-like models use BLOOD for their weaponskills
                                                    // TODO: figure out a good way to differentiate between the two. There does not seem to be a functional difference.
    }
}