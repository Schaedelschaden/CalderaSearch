﻿/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

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

#include "attackround.h"
#include "packets/inventory_finish.h"
#include "items/item_weapon.h"
#include "status_effect_container.h"
#include "ai/ai_container.h"
#include "mob_modifier.h"
#include "utils/battleutils.h"

/************************************************************************
*																		*
*  Constructor.															*
*																		*
************************************************************************/
CAttackRound::CAttackRound(CBattleEntity* attacker, CBattleEntity* defender)
{
    m_attacker = attacker;
    m_defender = defender;
    m_kickAttackOccured = false;
    m_sataOccured = false;
    m_subWeaponType = 0;

    if (auto weapon = dynamic_cast<CItemWeapon*>(attacker->m_Weapons[SLOT_SUB]))
    {
        m_subWeaponType = weapon->getDmgType();
    }

    // Grab a trick attack assistant.
    m_taEntity = battleutils::getAvailableTrickAttackChar(attacker, attacker->GetBattleTarget());

    // Get cover partner
    if (attacker->GetBattleTarget()->objtype == TYPE_PC)
    {
        m_coverAbilityUserEntity = battleutils::GetCoverAbilityUser(attacker->GetBattleTarget(), attacker);
    }
    else
    {
        m_coverAbilityUserEntity = nullptr;
    }

    // Build main weapon attacks.
    CreateAttacks(dynamic_cast<CItemWeapon*>(attacker->m_Weapons[SLOT_MAIN]), RIGHTATTACK);

    // Build dual wield off hand weapon attacks.
    if (IsH2H())
    {
        // Build left hand H2H attacks.
        CreateAttacks(dynamic_cast<CItemWeapon*>(attacker->m_Weapons[SLOT_MAIN]), LEFTATTACK);

        // Build kick attacks.
        CreateKickAttacks();
    }

    else if (attacker->m_dualWield)
    {
        CreateAttacks(dynamic_cast<CItemWeapon*>(attacker->m_Weapons[SLOT_SUB]), LEFTATTACK);
    }

    // Build Daken throw
    CreateDakenAttack();

    // Set the first attack flag
    m_attackSwings[0].SetAsFirstSwing();

    // Delete the haste samba effect.
    attacker->StatusEffectContainer->DelStatusEffect(EFFECT_HASTE_SAMBA_HASTE);

    // Clear the action list.
    attacker->m_ActionList.clear();
}

/************************************************************************
*																		*
*  Destructor.															*
*																		*
************************************************************************/
CAttackRound::~CAttackRound()
{

}

/************************************************************************
*																		*
*  Returns the attack swing count.										*
*																		*
************************************************************************/
uint8 CAttackRound::GetAttackSwingCount()
{
    return (uint8)m_attackSwings.size();
}

/************************************************************************
*																		*
*  Returns an attack via index.											*
*																		*
************************************************************************/
CAttack& CAttackRound::GetAttack(uint8 index)
{
    return m_attackSwings[index];
}

/************************************************************************
*																		*
*  Returns the current attack.											*
*																		*
************************************************************************/
CAttack& CAttackRound::GetCurrentAttack()
{
    return m_attackSwings[0];
}

/************************************************************************
*																		*
*  Sets the SATA flag.													*
*																		*
************************************************************************/
void CAttackRound::SetSATA(bool value)
{
    m_sataOccured = value;
}

/************************************************************************
*																		*
*  Returns the SATA flag.												*
*																		*
************************************************************************/
bool CAttackRound::GetSATAOccured()
{
    return m_sataOccured;
}

/************************************************************************
*																		*
*  Returns the TA entity.												*
*																		*
************************************************************************/
CBattleEntity*	CAttackRound::GetTAEntity()
{
    return m_taEntity;
}

/************************************************************************
*                                                                       *
*  Returns the Cover entity.                                            *
*                                                                       *
************************************************************************/
CBattleEntity* CAttackRound::GetCoverAbilityUserEntity()
{
    return m_coverAbilityUserEntity;
}

/************************************************************************
*                                                                       *
*  Returns the H2H flag.                                                *
*                                                                       *
************************************************************************/
bool CAttackRound::IsH2H()
{
    if (auto weapon = dynamic_cast<CItemWeapon*>(m_attacker->m_Weapons[SLOT_MAIN]))
        return weapon->getSkillType() == SKILL_HAND_TO_HAND;
    return false;
}

/************************************************************************
*																		*
*  Adds an attack swing.												*
*																		*
************************************************************************/
void CAttackRound::AddAttackSwing(PHYSICAL_ATTACK_TYPE type, PHYSICAL_ATTACK_DIRECTION direction, uint8 count)
{
    if (m_attackSwings.size() < MAX_ATTACKS)
    {
        for (uint8 i = 0; i < count; ++i)
        {
            CAttack attack(m_attacker, m_defender, type, direction, this);
            m_attackSwings.push_back(attack);

            if (m_attackSwings.size() == MAX_ATTACKS)
            {
                return;
            }
        }
    }
}

/************************************************************************
*																		*
*  Deletes the first attack in the list.								*
*																		*
************************************************************************/
void CAttackRound::DeleteAttackSwing()
{
    m_attackSwings.erase(m_attackSwings.begin());
}

/************************************************************************
*                                                                       *
*  Creates up to many attacks for a particular hand.			        *
*                                                                       *
************************************************************************/
void CAttackRound::CreateAttacks(CItemWeapon* PWeapon, PHYSICAL_ATTACK_DIRECTION direction)
{
	CCharEntity* PChar = (CCharEntity*)m_attacker;
	
    if (!PWeapon)
        return;

    uint8 num = 1;

    bool isPC = m_attacker->objtype == TYPE_PC;

    // Checking the players weapon hit count
    if (PWeapon->getReqLvl() <= m_attacker->GetMLevel())
    {
        num = PWeapon->getHitCount();
    }
	
	// Octave club handling
	if (PWeapon->getID() == 18852)
	{
		if (m_attacker->GetMLevel() % 2 == 0)
		{
			num = tpzrand::GetRandomNumber(2);
		}
		else if (m_attacker->GetMLevel() % 3 == 0)
		{
			num = tpzrand::GetRandomNumber(3);
		}
		else if (m_attacker->GetMLevel() % 4 == 0)
		{
			num = tpzrand::GetRandomNumber(4);
		}
		else if (m_attacker->GetMLevel() % 5 == 0)
		{
			num = tpzrand::GetRandomNumber(5);
		}
		else if (m_attacker->GetMLevel() % 6 == 0)
		{
			num = tpzrand::GetRandomNumber(6);
		}
		else if (m_attacker->GetMLevel() % 7 == 0)
		{
			num = tpzrand::GetRandomNumber(7);
		}
		else if (m_attacker->GetMLevel() % 8 == 0)
		{
			num = tpzrand::GetRandomNumber(8);
		}
		else if (m_attacker->GetMLevel() == 99)
		{
			num = tpzrand::GetRandomNumber(8);
		}
	}
	
	// Existance of "Occasionally attacks X times" overwrites PWeapon hit count
    if (isPC && m_attacker->getMod(Mod::MAX_SWINGS))
    {
        auto modSwings = std::min<uint8>((uint8)static_cast<CCharEntity*>(m_attacker)->getMod(Mod::MAX_SWINGS),8);
        num = battleutils::getHitCount(modSwings);
    }

    // If the attacker is a mobentity or derived from mobentity, check to see if it has any special mutli-hit capabilties
    if (dynamic_cast<CMobEntity*>(m_attacker))
    {
        auto multiHitMax = (uint8)static_cast<CMobEntity*>(m_attacker)->getMobMod(MOBMOD_MULTI_HIT);

        if (multiHitMax > 0)
            num = 1 + battleutils::getHitCount(multiHitMax);
    }

    // Checking the players triple, double and quadruple attack
    int16 tripleAttack = m_attacker->getMod(Mod::TRIPLE_ATTACK);
    int16 doubleAttack = m_attacker->getMod(Mod::DOUBLE_ATTACK);
    int16 quadAttack = m_attacker->getMod(Mod::QUAD_ATTACK);
	bool multiHitOccurred = false;
	
    // Checking for Mythic Weapon Aftermath
    int16 occAttThriceRate = std::clamp<int16>(m_attacker->getMod(Mod::MYTHIC_OCC_ATT_THRICE), 0, 100);
    int16 occAttTwiceRate = std::clamp<int16>(m_attacker->getMod(Mod::MYTHIC_OCC_ATT_TWICE), 0, 100);

    // Checking for merit upgrades
    if (isPC)
    {
        // Merit chance only applies if player has the job trait
        if (charutils::hasTrait(PChar, TRAIT_TRIPLE_ATTACK))
		{
			tripleAttack += PChar->PMeritPoints->GetMeritValue(MERIT_TRIPLE_ATTACK_RATE, PChar);
		}

        // Ambush Augment adds +1% Triple Attack per merit (need to satisfy conditions for Ambush)
        if (charutils::hasTrait(PChar, TRAIT_AMBUSH) && PChar->getMod(Mod::AUGMENTS_AMBUSH) > 0 && abs(m_defender->loc.p.rotation - m_attacker->loc.p.rotation) < 23)
        {
            tripleAttack += PChar->PMeritPoints->GetMerit(MERIT_AMBUSH)->count;
        }

        if (charutils::hasTrait(PChar, TRAIT_DOUBLE_ATTACK))
		{	
			doubleAttack += PChar->PMeritPoints->GetMeritValue(MERIT_DOUBLE_ATTACK_RATE, PChar);
		}
		
		// Augments Innin gear mod (Adds bonus Double Attack when attacking from behind)
		if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_INNIN) && abs(m_defender->loc.p.rotation - m_attacker->loc.p.rotation) < 23
			&& PChar->getMod(Mod::AUGMENT_INNIN) > 0)
		{
			doubleAttack += PChar->getMod(Mod::AUGMENT_INNIN);
		}
		
		// Dancer's Striking Flourish
		if (m_attacker->StatusEffectContainer->HasStatusEffect(EFFECT_STRIKING_FLOURISH) && (direction == PHYSICAL_ATTACK_DIRECTION::RIGHTATTACK))
		{
			doubleAttack = 100;
		}
		
		// Dancer's Ternary Flourish
		if (m_attacker->StatusEffectContainer->HasStatusEffect(EFFECT_TERNARY_FLOURISH) && (direction == PHYSICAL_ATTACK_DIRECTION::RIGHTATTACK))
		{
			tripleAttack = 100;
		}
        // TODO: Quadruple attack merits when SE release them.
    }

    quadAttack = std::clamp<int16>(quadAttack, 0, 100);
    doubleAttack = std::clamp<int16>(doubleAttack, 0, 100);
    tripleAttack = std::clamp<int16>(tripleAttack, 0, 100);
	
	// Preference matters! The following are additional hits to the default hit that don't stack up
    // Mikage > SU3 Weapon Follow-Up > Quad > Triple > Double > Mythic Aftermath > Occasionally Attacks > Dynamis [D] Follow-Up > Hasso + Zanshin
    // Daken is handled separately in CreateDakenAttack() and Zanshin in src/map/entities/battleentity.cpp

    // Checking Mikage Effect - Hits Vary With Num of Utsusemi Shadows for Main Weapon
    if (m_attacker->StatusEffectContainer->HasStatusEffect(EFFECT_MIKAGE) && m_attacker->m_Weapons[SLOT_MAIN]->getID() == PWeapon->getID())
    {
        auto shadows = (uint8)m_attacker->getMod(Mod::UTSUSEMI);
        //ShowDebug(CL_CYAN"Create Attacks: Mikage Active, Rolling Attack Chance for %d Shadowss...\n" CL_RESET, shadows);
        AddAttackSwing(PHYSICAL_ATTACK_TYPE::NORMAL, direction, shadows);
    }
    else if (num == 1 && tpzrand::GetRandomNumber(100) < quadAttack)
	{
        AddAttackSwing(PHYSICAL_ATTACK_TYPE::QUAD, direction, 4);
		multiHitOccurred = true;
	}

    else if (num == 1 && tpzrand::GetRandomNumber(100) < tripleAttack)
	{
        AddAttackSwing(PHYSICAL_ATTACK_TYPE::TRIPLE, direction, 3);
		multiHitOccurred = true;
	}

    else if (num == 1 && tpzrand::GetRandomNumber(100) < doubleAttack)
	{
        AddAttackSwing(PHYSICAL_ATTACK_TYPE::DOUBLE, direction, 2);
		multiHitOccurred = true;
	}
    // Mythic Weapons Aftermath, only main hand
    else if (direction == PHYSICAL_ATTACK_DIRECTION::RIGHTATTACK && tpzrand::GetRandomNumber(100) < occAttThriceRate)
    {
        AddAttackSwing(PHYSICAL_ATTACK_TYPE::NORMAL, direction, 3);
		multiHitOccurred = true;
    }
    else if (direction == PHYSICAL_ATTACK_DIRECTION::RIGHTATTACK && tpzrand::GetRandomNumber(100) < occAttTwiceRate)
    {
        AddAttackSwing(PHYSICAL_ATTACK_TYPE::NORMAL, direction, 2);
		multiHitOccurred = true;
    }
    // Iga Garb +2 Set augment: possibility to add another swing while using Dual Wield
    // TODO: Double check correct priority for Empyrian armor modifiers? Outsource? Lua function?
    else if (direction == LEFTATTACK && tpzrand::GetRandomNumber(100) < m_attacker->getMod(Mod::EXTRA_DUAL_WIELD_ATTACK))
    {
        AddAttackSwing(PHYSICAL_ATTACK_TYPE::NORMAL, RIGHTATTACK, 1);
    }
    // "Occasionally attacks X times" and regular multiple hits
    else if (num > 1)
    {
        // Deduct the final default hit!
        AddAttackSwing(PHYSICAL_ATTACK_TYPE::NORMAL, direction, (num - 1));
    }
    // TODO: Dynamis [D] weapons Follow-Up attack chance
	
	// Additional swing modifier (stacks!), mostly for Amood weapons
	if (isPC && tpzrand::GetRandomNumber(100) < m_attacker->getMod(Mod::ADDITIONAL_SWING_CHANCE))
	{
        int16 occAttThriceRate = std::clamp<int16>(m_attacker->getMod(Mod::MYTHIC_OCC_ATT_THRICE), 0, 100);
        AddAttackSwing(PHYSICAL_ATTACK_TYPE::NORMAL, direction, 1);
    }

    // Ammunition provoked additional swing (stacks!), mostly for Virtue Stone weapons
    if (isPC && m_attacker->getMod(Mod::AMMO_SWING) > 0)
    {
        // Check for ammo
        CCharEntity* PChar = (CCharEntity*)m_attacker;
        CItemEquipment* PAmmo = PChar->getEquip(SLOT_AMMO);
        CItemEquipment* PMain = PChar->getEquip(SLOT_MAIN);
        CItemEquipment* PSub = PChar->getEquip(SLOT_SUB);
        uint8 slot = PChar->equip[SLOT_AMMO];
        uint8 loc = PChar->equipLoc[SLOT_AMMO];
        uint8 ammoCount = 0;

        // Two handed and Hand-to-Hand
        if (battleutils::GetScaledItemModifier(PChar, PMain, Mod::AMMO_SWING_TYPE) == 2 &&
            tpzrand::GetRandomNumber(100) < m_attacker->getMod(Mod::AMMO_SWING) && PAmmo != nullptr && ammoCount < PAmmo->getQuantity())
        {
            AddAttackSwing(PHYSICAL_ATTACK_TYPE::NORMAL, direction, 1);
            ammoCount += 1;
        }
		// One handed
        else
        {
            if (direction == RIGHTATTACK && battleutils::GetScaledItemModifier(PChar, PMain, Mod::AMMO_SWING_TYPE) == 1 &&
                tpzrand::GetRandomNumber(100) < m_attacker->getMod(Mod::AMMO_SWING) && PAmmo != nullptr && ammoCount < PAmmo->getQuantity())
            {
                AddAttackSwing(PHYSICAL_ATTACK_TYPE::NORMAL, RIGHTATTACK, 1);
                ammoCount += 1;
            }
            if (direction == LEFTATTACK && PSub != nullptr && battleutils::GetScaledItemModifier(PChar, PSub, Mod::AMMO_SWING_TYPE) == 1 &&
                tpzrand::GetRandomNumber(100) < m_attacker->getMod(Mod::AMMO_SWING) && PAmmo != nullptr && ammoCount < PAmmo->getQuantity())
            {
                AddAttackSwing(PHYSICAL_ATTACK_TYPE::NORMAL, LEFTATTACK, 1);
                ammoCount += 1;
            }
        }
		// Deduct ammo
        if (PAmmo != nullptr)
        {
            if (PAmmo->getQuantity() == ammoCount)
            {
                charutils::UnequipItem(PChar, SLOT_AMMO);
                charutils::SaveCharEquip(PChar);
            }
            charutils::UpdateItem(PChar, loc, slot, -ammoCount);
            PChar->pushPacket(new CInventoryFinishPacket());
        }
    }
    // SU3/Raetic Weapon Follow-Up
    // https://www.bg-wiki.com/ffxi/Category:Superior_Equipment#Superior_3_(Su3)
    else if (m_attacker->getMod(Mod::CONSUME_MP_FOR_FOLLOWUP_MELEE) > 0)
    {
        JOBTYPE mJob   = m_attacker->GetMJob();
        int16   maxMP  = m_attacker->health.maxmp + m_attacker->getMod(Mod::MP);
        int16   reqMP  = (int16)(maxMP * 0.05f);
        int16   currMP = m_attacker->health.mp;
        int16   remMP  = -(int16)(maxMP * 0.05f);
        int16   chance = (int16)(maxMP * 0.05f); // Jobs which natively have MP (2,000 Max MP = 100% chance)
        int16   roll   = tpzrand::GetRandomNumber(100);

        // Adjust the chance multiplier to account for jobs which do not natively have MP (800 MP = 100% chance)
        switch (mJob)
		{
			case JOB_WAR:   chance = (int16)(maxMP * 0.125f);   break;
            case JOB_MNK:   chance = (int16)(maxMP * 0.125f);   break;
            case JOB_THF:   chance = (int16)(maxMP * 0.125f);   break;
            case JOB_BST:   chance = (int16)(maxMP * 0.125f);   break;
            case JOB_BRD:   chance = (int16)(maxMP * 0.125f);   break;
            case JOB_RNG:   chance = (int16)(maxMP * 0.125f);   break;
            case JOB_SAM:   chance = (int16)(maxMP * 0.125f);   break;
            case JOB_NIN:   chance = (int16)(maxMP * 0.125f);   break;
            case JOB_DRG:   chance = (int16)(maxMP * 0.125f);   break;
            case JOB_COR:   chance = (int16)(maxMP * 0.125f);   break;
            case JOB_PUP:   chance = (int16)(maxMP * 0.125f);   break;
            case JOB_DNC:   chance = (int16)(maxMP * 0.125f);   break;
			default: break;
		}

        if (chance > 100)
        {
            chance = 100;
        }

        if (currMP >= reqMP && roll < chance)
        {
            AddAttackSwing(PHYSICAL_ATTACK_TYPE::FOLLOWUP, direction, 1);
            m_attacker->addMP(remMP);
        }
    }

	// Default hit, necessary to check for multi hits as the hits are assigned as PHYSICAL_ATTACK_TYPE
	// Double and Triple Attack Damage + mods are assigned to hits based on attack type
	if (multiHitOccurred == false)
	{
		AddAttackSwing(PHYSICAL_ATTACK_TYPE::NORMAL, direction, 1);
	}
}

/************************************************************************
*                                                                       *
*  Creates kick attacks.										        *
*                                                                       *
************************************************************************/
void CAttackRound::CreateKickAttacks()
{
    if (m_attacker->objtype == TYPE_PC)
    {
        // kick attack mod (All jobs)
        uint16 kickAttack = m_attacker->getMod(Mod::KICK_ATTACK_RATE);

        if (m_attacker->GetMJob() == JOB_MNK) // MNK (Main job)
        {
            kickAttack += ((CCharEntity*)m_attacker)->PMeritPoints->GetMeritValue(MERIT_KICK_ATTACK_RATE, (CCharEntity*)m_attacker);
        }

        kickAttack = std::clamp<uint16>(kickAttack, 0, 100);

        if (tpzrand::GetRandomNumber(100) < kickAttack)
        {
            AddAttackSwing(PHYSICAL_ATTACK_TYPE::KICK, RIGHTATTACK, 1);
            m_kickAttackOccured = true;
        }

        // Tantra set mod: Try an extra left kick attack.
        if (m_kickAttackOccured && tpzrand::GetRandomNumber(100) < m_attacker->getMod(Mod::EXTRA_KICK_ATTACK))
        {
            AddAttackSwing(PHYSICAL_ATTACK_TYPE::KICK, LEFTATTACK, 1);
        }
    }
}

/************************************************************************
*																		*
*  Creates a Daken throw.												*
*																		*
************************************************************************/
void CAttackRound::CreateDakenAttack()
{
    if (m_attacker->objtype == TYPE_PC)
    {
        auto PAmmo = dynamic_cast<CItemWeapon*>(m_attacker->m_Weapons[SLOT_AMMO]);
        if (PAmmo && PAmmo->isShuriken())
        {
            uint16 daken = m_attacker->getMod(Mod::DAKEN);
            if (tpzrand::GetRandomNumber(100) < daken)
            {
				AddAttackSwing(PHYSICAL_ATTACK_TYPE::DAKEN, RIGHTATTACK, 1);
            }
			if (m_attacker->StatusEffectContainer->HasStatusEffect(EFFECT_SANGE))
			{
				CCharEntity* PChar = (CCharEntity*)m_attacker;
//				printf("attackround.cpp CreateDakenAttack HAS SANGE\n");
				battleutils::RemoveAmmo(PChar, 1);
			}
        }
    }
}
