/*
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

#include "../../common/showmsg.h"
#include "../../common/timer.h"
#include "../../common/utils.h"

#include <string.h>

#include "../packets/action.h"
#include "../packets/basic.h"
#include "../packets/char.h"
#include "../packets/char_appearance.h"
#include "../packets/char_health.h"
#include "../packets/char_recast.h"
#include "../packets/char_sync.h"
#include "../packets/char_update.h"
#include "../packets/event.h"
#include "../packets/event_string.h"
#include "../packets/inventory_finish.h"
#include "../packets/key_items.h"
#include "../packets/lock_on.h"
#include "../packets/menu_raisetractor.h"
#include "../packets/message_special.h"
#include "../packets/message_system.h"
#include "../packets/message_text.h"
#include "../packets/release.h"

#include "../ai/ai_container.h"
#include "../ai/controllers/player_controller.h"
#include "../ai/helpers/targetfind.h"
#include "../ai/states/ability_state.h"
#include "../ai/states/attack_state.h"
#include "../ai/states/death_state.h"
#include "../ai/states/item_state.h"
#include "../ai/states/magic_state.h"
#include "../ai/states/raise_state.h"
#include "../ai/states/range_state.h"
#include "../ai/states/weaponskill_state.h"

#include "../ability.h"
#include "../attack.h"
#include "../char_recast_container.h"
#include "../conquest_system.h"
#include "../enmity_container.h"
#include "../item_container.h"
#include "../items/item_furnishing.h"
#include "../items/item_usable.h"
#include "../items/item_weapon.h"
// #include "../job_points.h"
#include "../latent_effect_container.h"
#include "../mobskill.h"
#include "../modifier.h"
#include "../packets/char_job_extra.h"
#include "../packets/status_effects.h"
#include "../spell.h"
#include "../status_effect_container.h"
#include "../trade_container.h"
#include "../treasure_pool.h"
#include "../universal_container.h"
#include "../utils/attackutils.h"
#include "../utils/battleutils.h"
#include "../utils/charutils.h"
#include "../utils/gardenutils.h"
#include "../utils/petutils.h"
#include "../weapon_skill.h"
#include "automatonentity.h"
#include "charentity.h"
#include "trustentity.h"

CCharEntity::CCharEntity()
{
    objtype = TYPE_PC;
    m_EcoSystem = SYSTEM_HUMANOID;

    m_event.reset();
	
	// eventPreparation = new EventPrep();
    // currentEvent     = new EventInfo();
	
	// inSequence = false;
    // gotMessage = false;
    // m_Locked   = false;

    m_GMlevel = 0;
    m_isGMHidden = false;

    allegiance = ALLEGIANCE_PLAYER;

    TradeContainer = new CTradeContainer();
    Container      = new CTradeContainer();
    UContainer     = new CUContainer();
    CraftContainer = new CTradeContainer();

    m_Inventory  = std::make_unique<CItemContainer>(LOC_INVENTORY);
    m_Mogsafe    = std::make_unique<CItemContainer>(LOC_MOGSAFE);
    m_Storage    = std::make_unique<CItemContainer>(LOC_STORAGE);
    m_Tempitems  = std::make_unique<CItemContainer>(LOC_TEMPITEMS);
    m_Moglocker  = std::make_unique<CItemContainer>(LOC_MOGLOCKER);
    m_Mogsatchel = std::make_unique<CItemContainer>(LOC_MOGSATCHEL);
    m_Mogsack    = std::make_unique<CItemContainer>(LOC_MOGSACK);
    m_Mogcase    = std::make_unique<CItemContainer>(LOC_MOGCASE);
    m_Wardrobe   = std::make_unique<CItemContainer>(LOC_WARDROBE);
    m_Mogsafe2   = std::make_unique<CItemContainer>(LOC_MOGSAFE2);
    m_Wardrobe2  = std::make_unique<CItemContainer>(LOC_WARDROBE2);
    m_Wardrobe3  = std::make_unique<CItemContainer>(LOC_WARDROBE3);
    m_Wardrobe4  = std::make_unique<CItemContainer>(LOC_WARDROBE4);
    m_Wardrobe5  = std::make_unique<CItemContainer>(LOC_WARDROBE5);
    m_Wardrobe6  = std::make_unique<CItemContainer>(LOC_WARDROBE6);
    m_Wardrobe7  = std::make_unique<CItemContainer>(LOC_WARDROBE7);
    m_Wardrobe8  = std::make_unique<CItemContainer>(LOC_WARDROBE8);
    m_RecycleBin = std::make_unique<CItemContainer>(LOC_RECYCLEBIN);

    memset(&jobs, 0, sizeof(jobs));
    // TODO: -Wno-class-memaccess - clearing an object on non-trivial type use assignment or value-init
    memset(&keys, 0, sizeof(keys));
    memset(&equip, 0, sizeof(equip));
    memset(&equipLoc, 0, sizeof(equipLoc));
    memset(&RealSkills, 0, sizeof(RealSkills));
    memset(&expChain, 0, sizeof(expChain));
	// memset(&capacityChain, 0, sizeof(capacityChain));
    memset(&nameflags, 0, sizeof(nameflags));
    memset(&menuConfigFlags, 0, sizeof(menuConfigFlags));

    // TODO: -Wno-class-memaccess - clearing an object on non-trivial type use assignment or value-init
    memset(&m_SpellList, 0, sizeof(m_SpellList));
    memset(&m_LearnedAbilities, 0, sizeof(m_LearnedAbilities));
    memset(&m_TitleList, 0, sizeof(m_TitleList));
    memset(&m_ZonesList, 0, sizeof(m_ZonesList));
    memset(&m_Abilities, 0, sizeof(m_Abilities));
    memset(&m_TraitList, 0, sizeof(m_TraitList));
    memset(&m_PetCommands, 0, sizeof(m_PetCommands));
    memset(&m_WeaponSkills, 0, sizeof(m_WeaponSkills));
    memset(&m_SetBlueSpells, 0, sizeof(m_SetBlueSpells));
	// memset(&m_FieldChocobo, 0, sizeof(m_FieldChocobo));
    memset(&m_unlockedAttachments, 0, sizeof(m_unlockedAttachments));

    memset(&m_questLog, 0, sizeof(m_questLog));
    memset(&m_missionLog, 0, sizeof(m_missionLog));
    memset(&m_assaultLog, 0, sizeof(m_assaultLog));
    memset(&m_campaignLog, 0, sizeof(m_campaignLog));
    memset(&m_eminenceLog, 0, sizeof(m_eminenceLog));
    m_eminenceCache.activemap.reset();

    memset(&teleport, 0, sizeof(teleport));
    memset(&teleport.homepoint.menu, -1, sizeof(teleport.homepoint.menu));
    memset(&teleport.survival.menu,  -1, sizeof(teleport.survival.menu));

    for (uint8 i = 0; i <= 3; ++i)
    {
        m_missionLog[i].current = 0xFFFF;
    }

    m_missionLog[4].current = 0;   // MISSION_TOAU
    m_missionLog[5].current = 0;   // MISSION_WOTG
    m_missionLog[6].current = 101; // MISSION_COP
    for (uint8 i = 0; i < MAX_MISSIONAREA; ++i)
    {
        m_missionLog[i].logExUpper = 0;
        m_missionLog[i].logExLower = 0;
    }

    m_copCurrent = 0;
    m_acpCurrent = 0;
    m_mkeCurrent = 0;
    m_asaCurrent = 0;

    m_Costume            = 0;
    m_Monstrosity        = 0;
    m_hasTractor         = 0;
    m_hasRaise           = 0;
    m_hasAutoTarget      = 1;
    m_InsideRegionID     = 0;
    m_LevelRestriction   = 0;
    m_lastBcnmTimePrompt = 0;
    m_AHHistoryTimestamp = 0;
    m_DeathTimestamp     = 0;

    m_EquipFlag         = 0;
    m_EquipBlock        = 0;
    m_StatsDebilitation = 0;
    m_EquipSwap         = false;

    MeritMode = false;

    m_isWeaponSkillKill = false;
    m_isStyleLocked = false;
    m_isBlockingAid = false;

    BazaarID.clean();
    TradePending.clean();
    InvitePending.clean();

    PLinkshell1     = nullptr;
    PLinkshell2     = nullptr;
	// PUnityChat      = nullptr;
    PTreasurePool   = nullptr;
    PWideScanTarget = nullptr;

    PAutomaton             = nullptr;
    PClaimedMob            = nullptr;
    PRecastContainer       = std::make_unique<CCharRecastContainer>(this);
    PLatentEffectContainer = new CLatentEffectContainer(this);

    petZoningInfo.respawnPet = false;
    petZoningInfo.petID      = 0;
    petZoningInfo.petType    = PETTYPE_AVATAR;			// dummy data, the bool tells us to respawn if required
    petZoningInfo.petHP      = 0;
    petZoningInfo.petMP      = 0;
    petZoningInfo.petTP      = 0;

    m_PlayTime    = 0;
    m_SaveTime    = 0;
    m_reloadParty = 0;

    m_LastYell       = 0;
    m_moghouseID     = 0;
    m_moghancementID = 0;

    m_Substate = CHAR_SUBSTATE::SUBSTATE_NONE;

    PAI = std::make_unique<CAIContainer>(this, nullptr, std::make_unique<CPlayerController>(this), std::make_unique<CTargetFind>(this));
	
	hookedFish   = nullptr;
    lastCastTime = 0;
    nextFishTime = 0;
    fishingToken = 0;
    hookDelay    = 13;
}

CCharEntity::~CCharEntity()
{
    clearPacketList();

    if (PTreasurePool != nullptr)
    {
        // remove myself
        PTreasurePool->DelMember(this);
    }

    delete TradeContainer;
    delete Container;
    delete UContainer;
    delete CraftContainer;
    delete PMeritPoints;
}

uint8 CCharEntity::GetGender()
{
    return (look.race) % 2 ^ (look.race > 6);
}

bool CCharEntity::isPacketListEmpty()
{
    return PacketList.empty();
}

void CCharEntity::clearPacketList()
{
    while (!PacketList.empty())
    {
        delete popPacket();
    }
}

void CCharEntity::pushPacket(CBasicPacket* packet)
{
    TracyZoneScoped;
    TracyZoneIString(GetName());
    TracyZoneHex16(packet->id());

    std::lock_guard<std::mutex> lk(m_PacketListMutex);
    PacketList.push_back(packet);
}

void CCharEntity::pushPacket(std::unique_ptr<CBasicPacket> packet)
{
    pushPacket(packet.release());
}

CBasicPacket* CCharEntity::popPacket()
{
    std::lock_guard<std::mutex> lk(m_PacketListMutex);
    CBasicPacket* PPacket = PacketList.front();
    PacketList.pop_front();
    return PPacket;
}

PacketList_t CCharEntity::getPacketList()
{
    std::lock_guard<std::mutex> lk(m_PacketListMutex);
    return PacketList;
}

size_t CCharEntity::getPacketCount()
{
    std::lock_guard<std::mutex> lk(m_PacketListMutex);
    return PacketList.size();
}

void CCharEntity::erasePackets(uint8 num)
{
    for (auto i = 0; i < num; i++)
    {
        delete popPacket();
    }
}

bool CCharEntity::isNewPlayer()
{
    return menuConfigFlags.flags & NFLAG_NEWPLAYER;
}

void CCharEntity::setPetZoningInfo()
{
    if (PPet->objtype == TYPE_PET)
    {
        switch (((CPetEntity*)PPet)->getPetType())
        {
        case PETTYPE_JUG_PET:
            if (luautils::GetSettingsVariable("KEEP_JUGPET_THROUGH_ZONING") == 1)
            {
                petZoningInfo.petHP = PPet->health.hp;
                petZoningInfo.petTP = PPet->health.tp;
                petZoningInfo.petMP = PPet->health.mp;
                petZoningInfo.petType = ((CPetEntity*)PPet)->getPetType();
                break;
            }
            [[fallthrough]];
        case PETTYPE_AUTOMATON:
        case PETTYPE_WYVERN:
            petZoningInfo.petHP = PPet->health.hp;
            petZoningInfo.petTP = PPet->health.tp;
            petZoningInfo.petMP = PPet->health.mp;
            petZoningInfo.petType = ((CPetEntity*)PPet)->getPetType();
            break;
        default:
            break;
        }
    }
}

void CCharEntity::resetPetZoningInfo()
{
    // reset the petZoning info
    petZoningInfo.petHP = 0;
    petZoningInfo.petTP = 0;
    petZoningInfo.petMP = 0;
    petZoningInfo.respawnPet = false;
    petZoningInfo.petType = PETTYPE_AVATAR;
}

/************************************************************************
 *
 * Return the container with the specified ID. If the ID goes beyond, then
 * we protect the server from failing the use of temporary container
 * items as a plug (from this container items can not
 * move, wear, transmit, sell, etc.) Display fatal error message.
 *
 ************************************************************************/

CItemContainer* CCharEntity::getStorage(uint8 LocationID)
{
    switch (LocationID)
    {
        case LOC_INVENTORY:
            return m_Inventory.get();
        case LOC_MOGSAFE:
            return m_Mogsafe.get();
        case LOC_STORAGE:
            return m_Storage.get();
        case LOC_TEMPITEMS:
            return m_Tempitems.get();
        case LOC_MOGLOCKER:
            return m_Moglocker.get();
        case LOC_MOGSATCHEL:
            return m_Mogsatchel.get();
        case LOC_MOGSACK:
            return m_Mogsack.get();
        case LOC_MOGCASE:
            return m_Mogcase.get();
        case LOC_WARDROBE:
            return m_Wardrobe.get();
        case LOC_MOGSAFE2:
            return m_Mogsafe2.get();
        case LOC_WARDROBE2:
            return m_Wardrobe2.get();
        case LOC_WARDROBE3:
            return m_Wardrobe3.get();
        case LOC_WARDROBE4:
            return m_Wardrobe4.get();
        case LOC_WARDROBE5:
            return m_Wardrobe5.get();
        case LOC_WARDROBE6:
            return m_Wardrobe6.get();
        case LOC_WARDROBE7:
            return m_Wardrobe7.get();
        case LOC_WARDROBE8:
            return m_Wardrobe8.get();
        case LOC_RECYCLEBIN:
            return m_RecycleBin.get();
    }

    TPZ_DEBUG_BREAK_IF(LocationID >= MAX_CONTAINER_ID);	// Unresolved storage ID
    return nullptr;
}

int8 CCharEntity::getShieldSize()
{
    CItemEquipment* PItem = (CItemEquipment*)(getEquip(SLOT_SUB));

    if (PItem == nullptr) {
        return 0;
    }

    if (!PItem->IsShield()) {
        return 0;
    }

    return PItem->getShieldSize();
}

void CCharEntity::SetName(int8* name)
{
    this->name.insert(0, (const char*)name, std::min<size_t>(strlen((const char*)name), PacketNameLength));
}

int16 CCharEntity::addTP(int16 tp)
{
    // int16 oldtp = health.tp;
    tp = CBattleEntity::addTP(tp);
    //	if ((oldtp < 1000 && health.tp >= 1000 ) || (oldtp >= 1000 && health.tp < 1000))
    //	{
    PLatentEffectContainer->CheckLatentsTP();
    //	}
    return abs(tp);
}

int32 CCharEntity::addHP(int32 hp)
{
    hp = CBattleEntity::addHP(hp);
    PLatentEffectContainer->CheckLatentsHP();

    return abs(hp);
}

int32 CCharEntity::addMP(int32 mp)
{
    mp = CBattleEntity::addMP(mp);
    PLatentEffectContainer->CheckLatentsMP();

    return abs(mp);
}

bool CCharEntity::getWeaponSkillKill()
{
    return m_isWeaponSkillKill;
}

void CCharEntity::setWeaponSkillKill(bool isWeaponSkillKill)
{
    m_isWeaponSkillKill = isWeaponSkillKill;
}

bool CCharEntity::getStyleLocked()
{
    return m_isStyleLocked;
}

void CCharEntity::setStyleLocked(bool isStyleLocked)
{
    m_isStyleLocked = isStyleLocked;
}

bool CCharEntity::getBlockingAid()
{
    return m_isBlockingAid;
}

void CCharEntity::setBlockingAid(bool isBlockingAid)
{
    m_isBlockingAid = isBlockingAid;
}

void CCharEntity::SetPlayTime(uint32 playTime)
{
    m_PlayTime = playTime;
    m_SaveTime = gettick() / 1000;
}

uint32 CCharEntity::GetPlayTime(bool needUpdate)
{
    if (needUpdate)
    {
        uint32 currentTime = gettick() / 1000;

        m_PlayTime += currentTime - m_SaveTime;
        m_SaveTime = currentTime;
    }

    return m_PlayTime;
}

CItemEquipment* CCharEntity::getEquip(SLOTTYPE slot)
{
    uint8 loc = equip[slot];
    uint8 est = equipLoc[slot];
    CItemEquipment* item = nullptr;

    if (loc != 0)
    {
        item = (CItemEquipment*)getStorage(est)->GetItem(loc);
    }
    return item;
}

void CCharEntity::ReloadPartyInc()
{
    m_reloadParty = true;
}

void CCharEntity::ReloadPartyDec()
{
    m_reloadParty = false;
}

bool CCharEntity::ReloadParty()
{
    return m_reloadParty;
}

void CCharEntity::RemoveTrust(CTrustEntity* PTrust)
{
    if (!PTrust->PAI->IsSpawned())
    {
        return;
    }

    auto trustIt = std::find_if(PTrusts.begin(), PTrusts.end(), [PTrust](auto trust) { return PTrust == trust; });
    if (trustIt != PTrusts.end())
    {
        if (PTrust->animation == ANIMATION_DESPAWN)
        {
            luautils::OnMobDespawn(PTrust);
        }
        PTrust->PAI->Despawn();
        PTrusts.erase(trustIt);
    }

    ReloadPartyInc();
}

void CCharEntity::ClearTrusts()
{
    for (auto PTrust : PTrusts)
    {
        PTrust->PAI->Despawn();
    }
    PTrusts.clear();

    ReloadPartyInc();
}

void CCharEntity::Tick(time_point tick)
{
    TracyZoneScoped;
    CBattleEntity::Tick(tick);
    if (m_DeathTimestamp > 0 && tick >= m_deathSyncTime)
    {
        // Send an update packet at a regular interval to keep the player's death variables synced
        updatemask |= UPDATE_STATUS;
        m_deathSyncTime = tick + death_update_frequency;
    }

    if (m_moghouseID != 0)
    {
        gardenutils::UpdateGardening(this, true);
    }
}

void CCharEntity::PostTick()
{
    TracyZoneScoped;
    CBattleEntity::PostTick();
    if (m_EquipSwap)
    {
        pushPacket(new CCharAppearancePacket(this));

        updatemask |= UPDATE_HP;
        m_EquipSwap = false;
    }
    if (ReloadParty())
    {
        charutils::ReloadParty(this);
    }
    if (m_EffectsChanged)
    {
        pushPacket(new CCharUpdatePacket(this));
        pushPacket(new CCharSyncPacket(this));
        pushPacket(new CCharJobExtraPacket(this, true));
        pushPacket(new CCharJobExtraPacket(this, false));
        pushPacket(new CStatusEffectPacket(this));
        if (PParty)
        {
            PParty->PushEffectsPacket();
        }
        m_EffectsChanged = false;
    }
    if (updatemask)
    {
        if (loc.zone && !m_isGMHidden)
        {
            loc.zone->PushPacket(this, CHAR_INRANGE, new CCharPacket(this, ENTITY_UPDATE, updatemask));
        }
        if (isCharmed)
        {
            pushPacket(new CCharPacket(this, ENTITY_UPDATE, updatemask));
        }
        if (updatemask & UPDATE_HP)
        {
            ForAlliance([&](auto PEntity)
            {
                if (PEntity->objtype == TYPE_PC)
                {
                    static_cast<CCharEntity*>(PEntity)->pushPacket(new CCharHealthPacket(this));
                }
            });
        }
        // Do not send an update packet when only the position has change
        if (updatemask ^ UPDATE_POS)
        pushPacket(new CCharUpdatePacket(this));
        updatemask = 0;
    }
}

void CCharEntity::addTrait(CTrait* PTrait)
{
    CBattleEntity::addTrait(PTrait);
    charutils::addTrait(this, PTrait->getID());
}

void CCharEntity::delTrait(CTrait* PTrait)
{
    CBattleEntity::delTrait(PTrait);
    charutils::delTrait(this, PTrait->getID());
}

bool CCharEntity::ValidTarget(CBattleEntity* PInitiator, uint16 targetFlags)
{
    if (StatusEffectContainer->GetConfrontationEffect() != PInitiator->StatusEffectContainer->GetConfrontationEffect())
    {
        return false;
    }
    if (isDead())
    {
        return (targetFlags & TARGET_PLAYER_DEAD) != 0;
    }

    if ((targetFlags & TARGET_PLAYER) && allegiance == PInitiator->allegiance)
    {
        return true;
    }

    if (CBattleEntity::ValidTarget(PInitiator, targetFlags))
    {
        return true;
    }

    if (((targetFlags & TARGET_PLAYER_PARTY) || ((targetFlags & TARGET_PLAYER_PARTY_PIANISSIMO) &&
        PInitiator->StatusEffectContainer->HasStatusEffect(EFFECT_PIANISSIMO))) &&
        ((PParty && PInitiator->PParty == PParty) ||
        (PInitiator->PMaster && PInitiator->PMaster->PParty == PParty)) &&
        PInitiator != this)
    {
        return true;
    }
	
	if (targetFlags & TARGET_PLAYER_PARTY_ENTRUST)
    {
        if (!PInitiator->StatusEffectContainer->HasStatusEffect(EFFECT_ENTRUST) && PInitiator == this)
        {
            return true;
        }
        else if (PInitiator->StatusEffectContainer->HasStatusEffect(EFFECT_ENTRUST) && ((PParty && PInitiator->PParty == PParty) && PInitiator != this))
        {
            return true;
        }
    }

    return false;
}

bool CCharEntity::CanUseSpell(CSpell* PSpell)
{
    return charutils::hasSpell(this, static_cast<uint16>(PSpell->getID())) && CBattleEntity::CanUseSpell(PSpell) &&
        !PRecastContainer->Has(RECAST_MAGIC, static_cast<uint16>(PSpell->getID()));
}

void CCharEntity::OnChangeTarget(CBattleEntity* PNewTarget)
{
    battleutils::RelinquishClaim(this);
    pushPacket(new CLockOnPacket(this, PNewTarget));
    PLatentEffectContainer->CheckLatentsTargetChange();
}

void CCharEntity::OnEngage(CAttackState& state)
{
    CBattleEntity::OnEngage(state);
    PLatentEffectContainer->CheckLatentsTargetChange();
}

void CCharEntity::OnDisengage(CAttackState& state)
{
    battleutils::RelinquishClaim(this);
    CBattleEntity::OnDisengage(state);
    if (state.HasErrorMsg())
    {
        pushPacket(state.GetErrorMsg());
    }
    PLatentEffectContainer->CheckLatentsWeaponDraw(false);
}

bool CCharEntity::CanAttack(CBattleEntity* PTarget, std::unique_ptr<CBasicPacket>& errMsg)
{
    float dist = distance(loc.p, PTarget->loc.p);

    if (!IsMobOwner(PTarget))
    {
        errMsg = std::make_unique<CMessageBasicPacket>(this, PTarget, 0, 0, MSGBASIC_ALREADY_CLAIMED);

        PAI->Disengage();
        return false;
    }
    else if (dist > 30)
    {
        errMsg = std::make_unique<CMessageBasicPacket>(this, PTarget, 0, 0, MSGBASIC_LOSE_SIGHT);
        PAI->Disengage();
        return false;
    }
    else if (!facing(this->loc.p, PTarget->loc.p, 64))
    {
        errMsg = std::make_unique<CMessageBasicPacket>(this, PTarget, 0, 0, MSGBASIC_UNABLE_TO_SEE_TARG);
        return false;
    }
    else if ((dist - PTarget->m_ModelSize) > GetMeleeRange())
    {
        errMsg = std::make_unique<CMessageBasicPacket>(this, PTarget, 0, 0, MSGBASIC_TARG_OUT_OF_RANGE);
        return false;
    }
    return true;
}

bool CCharEntity::OnAttack(CAttackState& state, action_t& action)
{
    auto controller {static_cast<CPlayerController*>(PAI->GetController())};
    controller->setLastAttackTime(server_clock::now());
    auto ret = CBattleEntity::OnAttack(state, action);

    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    if (PTarget->isDead())
    {
        if (this->m_hasAutoTarget && PTarget->objtype == TYPE_MOB) // Auto-Target
        {
            for (auto&& PPotentialTarget : this->SpawnMOBList)
            {
                if (PPotentialTarget.second->animation == ANIMATION_ATTACK &&
                    infront(this->loc.p, PPotentialTarget.second->loc.p, 64) &&
                    // facing(this->loc.p, PPotentialTarget.second->loc.p, 64) &&
                    distance(this->loc.p, PPotentialTarget.second->loc.p) <= 15)
                {
                    std::unique_ptr<CBasicPacket> errMsg;
                    if (IsValidTarget(PPotentialTarget.second->targid, TARGET_ENEMY, errMsg))
                    {
                        controller->ChangeTarget(PPotentialTarget.second->targid);
                    }
                }
            }
        }
    }
    return ret;
}

void CCharEntity::OnCastFinished(CMagicState& state, action_t& action)
{
    CBattleEntity::OnCastFinished(state, action);

    auto PSpell = state.GetSpell();
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    PRecastContainer->Add(RECAST_MAGIC, static_cast<uint16>(PSpell->getID()), action.recast);
	
	uint16 currentTP = health.tp;

    for (auto&& actionList : action.actionLists)
    {
        for (auto&& actionTarget : actionList.actionTargets)
        {
            if (actionTarget.param > 0 && PSpell->dealsDamage() && PSpell->getSpellGroup() == SPELLGROUP_BLUE &&
                (StatusEffectContainer->HasStatusEffect(EFFECT_CHAIN_AFFINITY) || StatusEffectContainer->HasStatusEffect(EFFECT_AZURE_LORE)) &&
                static_cast<CBlueSpell*>(PSpell)->getPrimarySkillchain() != 0)
            {
                auto PBlueSpell = static_cast<CBlueSpell*>(PSpell);
                SUBEFFECT effect = battleutils::GetSkillChainEffect(PTarget, PBlueSpell->getPrimarySkillchain(), PBlueSpell->getSecondarySkillchain(), 0 );
                if (effect != SUBEFFECT_NONE)
                {
                    int32 skillChainDamage = battleutils::TakeSkillchainDamage(static_cast<CBattleEntity*>(this), PTarget, actionTarget.param, nullptr);

					if (skillChainDamage < 0)
					{
						actionTarget.addEffectParam = -skillChainDamage;
                        actionTarget.addEffectMessage = 384 + effect;
					}
					else
					{
						actionTarget.addEffectParam = skillChainDamage;
						actionTarget.addEffectMessage = 287 + effect;
					}
					actionTarget.additionalEffect = effect;
                }
                if (StatusEffectContainer->HasStatusEffect(EFFECT_AZURE_LORE))
				{
					health.tp = currentTP;
				}				
                else if (StatusEffectContainer->HasStatusEffect({EFFECT_SEKKANOKI, EFFECT_MEIKYO_SHISUI}))
                {
                    health.tp = (health.tp > 1000 ? health.tp - 1000 : 0);
                }
                else
                {
                    health.tp = 0;
                }

                StatusEffectContainer->DelStatusEffectSilent(EFFECT_CHAIN_AFFINITY);
            }
			
			if (actionTarget.param > 0 && PSpell->dealsDamage() && PSpell->getSpellGroup() == SPELLGROUP_BLACK &&
				(StatusEffectContainer->HasStatusEffect(EFFECT_IMMANENCE)))
			{
 				SUBEFFECT effect = SUBEFFECT_NONE;
				if (PSpell->getSpellFamily() == SPELLFAMILY_STONE || PSpell->getSpellFamily() == SPELLFAMILY_GEOHELIX)
				{
					effect = battleutils::GetSkillChainEffect(PTarget, 4, 0, 0);
				}
				else if (PSpell->getSpellFamily() == SPELLFAMILY_WATER || PSpell->getSpellFamily() == SPELLFAMILY_HYDROHELIX)
				{
					effect = battleutils::GetSkillChainEffect(PTarget, 5, 0, 0);
				}
				else if (PSpell->getSpellFamily() == SPELLFAMILY_AERO || PSpell->getSpellFamily() == SPELLFAMILY_ANEMOHELIX)
				{
					effect = battleutils::GetSkillChainEffect(PTarget, 6, 0, 0);
				}
				else if (PSpell->getSpellFamily() == SPELLFAMILY_FIRE || PSpell->getSpellFamily() == SPELLFAMILY_PYROHELIX)
				{
					effect = battleutils::GetSkillChainEffect(PTarget, 3, 0, 0);
				}
				else if (PSpell->getSpellFamily() == SPELLFAMILY_BLIZZARD || PSpell->getSpellFamily() == SPELLFAMILY_CRYOHELIX)
				{
					effect = battleutils::GetSkillChainEffect(PTarget, 7, 0, 0);
				}
				else if (PSpell->getSpellFamily() == SPELLFAMILY_THUNDER || PSpell->getSpellFamily() == SPELLFAMILY_IONOHELIX)
				{
					effect = battleutils::GetSkillChainEffect(PTarget, 8, 0, 0);
				}
				else if (PSpell->getSpellFamily() == SPELLFAMILY_LUMINOHELIX)
				{
					effect = battleutils::GetSkillChainEffect(PTarget, 1, 0, 0);
				}
				else if (PSpell->getSpellFamily() == SPELLFAMILY_NOCTOHELIX)
				{
					effect = battleutils::GetSkillChainEffect(PTarget, 2, 0, 0);
				}
				
				if (effect != SUBEFFECT_NONE)
				{
					int32 skillChainDamage = battleutils::TakeSkillchainDamage(static_cast<CBattleEntity*>(this), PTarget, actionTarget.param, nullptr);

					if (skillChainDamage < 0)
					{
						actionTarget.addEffectParam = -skillChainDamage;
                        actionTarget.addEffectMessage = 384 + effect;
					}
					else
					{
						actionTarget.addEffectParam = skillChainDamage;
						actionTarget.addEffectMessage = 287 + effect;
					}
					actionTarget.additionalEffect = effect;
				}
				
				StatusEffectContainer->DelStatusEffectSilent(EFFECT_IMMANENCE);
			}
        }
    }
    charutils::RemoveStratagems(this, PSpell);
    if (PSpell->tookEffect())
    {
        charutils::TrySkillUP(this, (SKILLTYPE)PSpell->getSkillType(), PTarget->GetMLevel());
		CItemWeapon* PItem = static_cast<CItemWeapon*>(getEquip(SLOT_RANGED));
		
		if (PSpell->getSkillType() == SKILL_GEOMANCY)
		{
			if (PItem && PItem->isType(ITEM_EQUIPMENT))
            {
                SKILLTYPE Skilltype = (SKILLTYPE)PItem->getSkillType();
                if (Skilltype == SKILL_HANDBELL)
                {
                    charutils::TrySkillUP(this, SKILL_HANDBELL, PTarget->GetMLevel());
                }
            }
		}
        if (PSpell->getSkillType() == SKILL_SINGING)
        {
            if (PItem && PItem->isType(ITEM_EQUIPMENT))
            {
                SKILLTYPE Skilltype = (SKILLTYPE)PItem->getSkillType();
                if (Skilltype == SKILL_STRING_INSTRUMENT || Skilltype == SKILL_WIND_INSTRUMENT || Skilltype == SKILL_SINGING)
                {
                    charutils::TrySkillUP(this, Skilltype, PTarget->GetMLevel());
                }
            }
        }
    }
}

void CCharEntity::OnCastInterrupted(CMagicState& state, action_t& action, MSGBASIC_ID msg)
{
    CBattleEntity::OnCastInterrupted(state, action, msg);

    auto message = state.GetErrorMsg();

    if (message)
    {
        pushPacket(message);
    }
}

void CCharEntity::OnWeaponSkillFinished(CWeaponSkillState& state, action_t& action)
{
    CBattleEntity::OnWeaponSkillFinished(state, action);

    auto PWeaponSkill = state.GetSkill();
    auto PBattleTarget = static_cast<CBattleEntity*>(state.GetTarget());

    int16 tp = state.GetSpentTP();
    tp = battleutils::CalculateWeaponSkillTP(this, PWeaponSkill, tp);

    PLatentEffectContainer->CheckLatentsTP();

    SLOTTYPE damslot = SLOT_MAIN;
    if (distance(loc.p, PBattleTarget->loc.p) - PBattleTarget->m_ModelSize <= PWeaponSkill->getRange())
    {
        if (PWeaponSkill->getID() >= 192 && PWeaponSkill->getID() <= 221)
        {
            damslot = SLOT_RANGED;
        }

        PAI->TargetFind->reset();
        //#TODO: revise parameters
        if (PWeaponSkill->isAoE())
        {
            PAI->TargetFind->findWithinArea(PBattleTarget, AOERADIUS_TARGET, PWeaponSkill->getAoeRange());
        }
        else
        {
            PAI->TargetFind->findSingleTarget(PBattleTarget);
        }

        for (auto&& PTarget : PAI->TargetFind->m_targets)
        {
            bool primary = PTarget == PBattleTarget;
            actionList_t& actionList = action.getNewActionList();
            actionList.ActionTargetID = PTarget->id;

            actionTarget_t& actionTarget = actionList.getNewActionTarget();

            uint16 tpHitsLanded;
            uint16 extraHitsLanded;
            int32 damage;
            CBattleEntity* taChar = battleutils::getAvailableTrickAttackChar(this, PTarget);

            actionTarget.reaction = REACTION_NONE;
            actionTarget.speceffect = SPECEFFECT_NONE;
            actionTarget.animation = PWeaponSkill->getAnimationId();
            actionTarget.messageID = 0;
            std::tie(damage, tpHitsLanded, extraHitsLanded) = luautils::OnUseWeaponSkill(this, PTarget, PWeaponSkill, tp, primary, action, taChar);

            if (!battleutils::isValidSelfTargetWeaponskill(PWeaponSkill->getID()))
            {
                if (primary && PBattleTarget->objtype == TYPE_MOB)
                {
                    luautils::OnWeaponskillHit(PBattleTarget, this, PWeaponSkill->getID());
                }
            }
            else
            {
                actionTarget.messageID = primary ? 224 : 276; //restores mp msg
                actionTarget.reaction = REACTION_HIT;
                damage = std::max(damage, 0);
                actionTarget.param = addMP(damage);
            }

            if (primary)
            {
                if (PWeaponSkill->getID() >= 193 && PWeaponSkill->getID() <= 203 || // All Archery WS's excluding Hybrid WS (Flaming Arrow)
                    PWeaponSkill->getID() >= 209 && PWeaponSkill->getID() <= 216 || // All Marksmanship WS excluding Hybrid & Magical WS (Hot Shot,
                    PWeaponSkill->getID() == 219 || PWeaponSkill->getID() == 221)   // Wildfire, Trueflight, and Leaden Salute)
                {
                    uint16 recycleChance = getMod(Mod::RECYCLE) + PMeritPoints->GetMeritValue(MERIT_RECYCLE, this);

                    if (StatusEffectContainer->HasStatusEffect(EFFECT_UNLIMITED_SHOT))
                    {
                        StatusEffectContainer->DelStatusEffect(EFFECT_UNLIMITED_SHOT);
                        recycleChance = 100;
                    }
                    if (tpzrand::GetRandomNumber(100) > recycleChance)
                    {
                        battleutils::RemoveAmmo(this);
                    }
                }
                if (actionTarget.reaction == REACTION_HIT)
                {
                    if (battleutils::GetScaledItemModifier(this, m_Weapons[damslot], Mod::ADDITIONAL_EFFECT))
                    {
                        actionTarget_t dummy;
                        luautils::OnAdditionalEffect(this, PTarget, static_cast<CItemWeapon*>(m_Weapons[damslot]), &dummy, damage);
                    }
                    else if (damslot == SLOT_RANGED && m_Weapons[SLOT_AMMO] && battleutils::GetScaledItemModifier(this, m_Weapons[damslot], Mod::ADDITIONAL_EFFECT))
                    {
                        actionTarget_t dummy;
                        luautils::OnAdditionalEffect(this, PTarget, static_cast<CItemWeapon*>(getEquip(SLOT_AMMO)), &dummy, damage);
                    }
                    int wspoints = 1;
                    if (PWeaponSkill->getPrimarySkillchain() != 0)
                    {
//						printf("charentity.cpp OnWeaponSkillFinished  DAMAGE: [%i]\n\n", damage);
                        // NOTE: GetSkillChainEffect is INSIDE this if statement because it
                        //  ALTERS the state of the resonance, which misses and non-elemental skills should NOT do.
                        SUBEFFECT effect = battleutils::GetSkillChainEffect(PBattleTarget, PWeaponSkill->getPrimarySkillchain(), PWeaponSkill->getSecondarySkillchain(), PWeaponSkill->getTertiarySkillchain() );
                        if (effect != SUBEFFECT_NONE)
                        {
                            actionTarget.addEffectParam = battleutils::TakeSkillchainDamage(this, PBattleTarget, damage, taChar);
                            if (actionTarget.addEffectParam < 0)
                            {
                                actionTarget.addEffectParam = -actionTarget.addEffectParam;
                                actionTarget.addEffectMessage = 384 + effect;
                            }
                            else
                                actionTarget.addEffectMessage = 287 + effect;
                            actionTarget.additionalEffect = effect;

                            if (effect >= 7)
                                wspoints += 1;
                            else if (effect >= 3)
                                wspoints += 2;
                            else
                                wspoints += 4;
                        }
                    }
                    // check for ws points
					uint8 mLvl = this->GetMLevel();
					uint8 iLvl = this->m_Weapons[SLOT_MAIN]->getILvl();
					uint8 riLvl = 0;
					uint8 targetLvl = PTarget->GetMLevel();
					
					if (this->getEquip(SLOT_RANGED) && this->getEquip(SLOT_RANGED)->isType(ITEM_WEAPON))
					{
						riLvl = this->m_Weapons[SLOT_RANGED]->getILvl();
					}
					
					if (iLvl > mLvl)
					{
						mLvl = iLvl;
					}
		
					if (riLvl > mLvl && riLvl > mLvl)
					{
						mLvl = riLvl;
					}
					
                    if (charutils::CheckMob(mLvl, targetLvl) > EMobDifficulty::TooWeak)
                    {
                        charutils::AddWeaponSkillPoints(this, damslot, wspoints);
                    }
                }
            }
			
			if (damage > 0)
			{
				// Trigger Treasure Hunter from weaponskill
				battleutils::ApplyTreasureHunter(this, PTarget, &actionTarget, false);
			}
        }
        battleutils::ClaimMob(PBattleTarget, this);

        auto controller {static_cast<CPlayerController*>(PAI->GetController())};

        if (PBattleTarget->isDead())
        {
            if (this->m_hasAutoTarget && PBattleTarget->objtype == TYPE_MOB) // Auto-Target
            {
                for (auto&& PPotentialTarget : this->SpawnMOBList)
                {
                    if (PPotentialTarget.second->animation == ANIMATION_ATTACK &&
                        infront(this->loc.p, PPotentialTarget.second->loc.p, 64) &&
                        // facing(this->loc.p, PPotentialTarget.second->loc.p, 64) &&
                        distance(this->loc.p, PPotentialTarget.second->loc.p) <= 15)
                    {
                        std::unique_ptr<CBasicPacket> errMsg;
                        if (IsValidTarget(PPotentialTarget.second->targid, TARGET_ENEMY, errMsg))
                        {
                            controller->ChangeTarget(PPotentialTarget.second->targid);
                        }
                    }
                }
            }
        }
    }
    else
    {
        loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, this, 0, 0, MSGBASIC_TOO_FAR_AWAY));
    }
}

void CCharEntity::OnAbility(CAbilityState& state, action_t& action)
{
	auto PChar = dynamic_cast<CCharEntity *>(this);
    auto PAbility = state.GetAbility();
	
    if (this->PRecastContainer->HasRecast(RECAST_ABILITY, PAbility->getRecastId(), PAbility->getRecastTime()))
    {
        pushPacket(new CMessageBasicPacket(this, this, 0, 0, MSGBASIC_WAIT_LONGER));
        return;
    }
	
    if (this->StatusEffectContainer->HasStatusEffect(EFFECT_AMNESIA)) {
        pushPacket(new CMessageBasicPacket(this, this, 0, 0, MSGBASIC_UNABLE_TO_USE_JA2));
        return;
    }
	
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());
    std::unique_ptr<CBasicPacket> errMsg;
	
    if (IsValidTarget(PTarget->targid, PAbility->getValidTarget(), errMsg))
    {
        if (this != PTarget && distance(this->loc.p, PTarget->loc.p) > PAbility->getRange())
        {
            pushPacket(new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_TOO_FAR_AWAY));
            return;
        }
		// Check if the player has enough MP to use the Blood Pact
        if (PAbility->getID() >= ABILITY_HEALING_RUBY && PAbility->getID() <= ABILITY_PERFECT_DEFENSE||
			PAbility->getID() >= ABILITY_CLARSACH_CALL && PAbility->getID() <= ABILITY_HYSTERIC_ASSAULT)
        {
            // Blood pact MP costs are stored under animation ID
            if (this->health.mp < PAbility->getAnimationID())
            {
                pushPacket(new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_UNABLE_TO_USE_JA));
                return;
            }
        }

        if (battleutils::IsParalyzed(this)) {
            // display paralyzed
            loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_IS_PARALYZED));
            return;
        }

        // get any available merit recast reduction
        uint8 meritRecastReduction = 0;
		int16 newRecast = 0;

        if (PAbility->getMeritModID() > 0 && !(PAbility->getAddType() & ADDTYPE_MERIT))
        {
            meritRecastReduction = PMeritPoints->GetMeritValue((MERIT_TYPE)PAbility->getMeritModID(), this);
        }

		// Handle charged abilities like Sic/Ready, Stratagems
        auto charge = ability::GetCharge(this, PAbility->getRecastId());
        if (charge && PAbility->getID() != ABILITY_SIC)
        {
			newRecast = (int16)(charge->chargeTime * PAbility->getRecastTime() - meritRecastReduction);
			
			if (newRecast < 2)
			{
				newRecast = 2;
			}
			
            action.recast = (uint16)newRecast;
        }
        else
        {
			newRecast = (int16)(PAbility->getRecastTime() - meritRecastReduction);
			
			if (newRecast < 2)
			{
				newRecast = 2;
			}
			
            action.recast = (uint16)newRecast;
        }

        if (PAbility->getID() == ABILITY_LIGHT_ARTS || PAbility->getID() == ABILITY_DARK_ARTS || PAbility->getRecastId() == 231) //stratagems
        {
            if (this->StatusEffectContainer->HasStatusEffect(EFFECT_TABULA_RASA))
                action.recast = 0;
        }
        else if (PAbility->getID() == ABILITY_DEACTIVATE && PAutomaton && PAutomaton->health.hp == PAutomaton->GetMaxHP())
        {
            CAbility* PAbility = ability::GetAbility(ABILITY_ACTIVATE);
            if (PAbility)
                PRecastContainer->Del(RECAST_ABILITY, PAbility->getRecastId());
        }
        // Handle Apogee and Astral Conduit's recast reset
		else if (PAbility->getID() >= ABILITY_HEALING_RUBY && PAbility->getID() <= ABILITY_PERFECT_DEFENSE ||
				PAbility->getID() == ABILITY_REGAL_GASH || PAbility->getID() >= ABILITY_CLARSACH_CALL &&
				PAbility->getID() <= ABILITY_HYSTERIC_ASSAULT)
        {
            if (this->StatusEffectContainer->HasStatusEffect(EFFECT_APOGEE) || this->StatusEffectContainer->HasStatusEffect(EFFECT_ASTRAL_CONDUIT))
            {
                action.recast = 0;
            }
			else
            {
				// Blood Pact recasts can be reduced by a total of 40 seconds
				int16 bpDelay = std::min<int16>(getMod(Mod::BP_DELAY), 15);
				int16 bpDelayII = std::min<int16>(getMod(Mod::BP_DELAY_II), 15);
				int16 favorDelay = std::min<int16>(getMod(Mod::AVATARS_FAVOR_BP_DELAY), 10);
                action.recast -= std::min(bpDelay + bpDelayII + favorDelay, 40);
            }
        }
		// Phantom Roll Ability Delay -#
		else if (PAbility->getID() >= ABILITY_FIGHTERS_ROLL && PAbility->getID() <= ABILITY_TACTICIANS_ROLL ||
				 PAbility->getID() >= ABILITY_ALLIES_ROLL && PAbility->getID() <= ABILITY_AVENGERS_ROLL ||
				 PAbility->getID() >= ABILITY_NATURALISTS_ROLL && PAbility->getID() <= ABILITY_RUNEISTS_ROLL)
		{
			int16 rollRecast = getMod(Mod::PHANTOM_ROLL_RECAST);
			action.recast += rollRecast;
		}

        // remove invisible if aggressive
        if (PAbility->getID() != ABILITY_TAME && PAbility->getID() != ABILITY_FIGHT)
        {
            if (PAbility->getValidTarget() & TARGET_ENEMY) {
                // aggressive action
                StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);
            }
            else if (PAbility->getID() != ABILITY_TRICK_ATTACK) {
                // remove invisible only
                StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_INVISIBLE);
            }
        }

       /*  if (PAbility->getID() == ABILITY_REWARD) {
            CItem* PItem = getEquip(SLOT_HEAD);
            if (PItem && (PItem->getID() == 15157 || PItem->getID() == 15158 || PItem->getID() == 16104 || PItem->getID() == 16105)) {
                //TODO: Transform this into an item Mod::REWARD_RECAST perhaps ?
                //The Bison/Brave's Warbonnet & Khimaira/Stout Bonnet reduces recast time by 10 seconds.
                action.recast -= 10;   // remove 10 seconds
            }
        } */

        action.id = this->id;
        action.actiontype = PAbility->getActionType();
        action.actionid = PAbility->getID();

        if (PAbility->isPetAbility())
        {
            if (PPet) // Is a bp - don't display msg and notify pet
            {
                actionList_t& actionList = action.getNewActionList();
                actionList.ActionTargetID = PTarget->id;
                actionTarget_t& actionTarget = actionList.getNewActionTarget();
                actionTarget.animation = 94; //assault anim
                actionTarget.reaction = REACTION_NONE;
                actionTarget.speceffect = SPECEFFECT_RECOIL;
                actionTarget.param = 0;
                actionTarget.messageID = 0;

                auto PPetTarget = PTarget->targid;
				
				// Handle Apogee and Blood Boon MP Cost modifications
                if (PAbility->getID() >= ABILITY_HEALING_RUBY && PAbility->getID() <= ABILITY_PERFECT_DEFENSE||
					PAbility->getID() >= ABILITY_CLARSACH_CALL && PAbility->getID() <= ABILITY_HYSTERIC_ASSAULT)
                {
                    // Handle Blood Pact MP Cost. Cost stored in abilities.sql animation column
                    float mpCost = PAbility->getAnimationID();
//					printf("\ncharentity.cpp onAbility BLOOD PACT MP COST: [%i]\n", (int16)mpCost);

                    if (StatusEffectContainer->HasStatusEffect(EFFECT_APOGEE))
                    {
                        mpCost *= 1.5f;
                        StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_BLOODPACT);
//						printf("charentity.cpp onAbility APOGEE MP COST: [%i]\n", (int16)mpCost);
                    }

                    // Handle Blood Boon (does not affect Astral Flow BPs)
                    if ((PAbility->getAddType() & ADDTYPE_ASTRAL_FLOW) == 0)
                    {
                        int16 bloodBoonRate = getMod(Mod::BLOOD_BOON);
                        if (tpzrand::GetRandomNumber(100) < bloodBoonRate)
                        {
							float costReduction = tpzrand::GetRandomNumber(8.f, 16.f) / 16.f;
                            mpCost *= costReduction;
							this->SetLocalVar("BloodBoonActivated", (uint32)(costReduction * 100));
//							printf("charentity.cpp onAbility BLOOD BOON MP COST: [%i]\n", (int16)mpCost);
                        }
                    }

                    // Subtract MP from player
                    addMP((int32)-mpCost);
				}
				
                if (PAbility->getValidTarget() == TARGET_SELF)
                {
//					printf("charentity.cpp onAbility SELF TARGET\n");
                    PPetTarget = PPet->targid;
                }
                else
                {
                    auto PMobSkill = battleutils::GetMobSkill(PAbility->getMobSkillID());
                    if (PMobSkill)
                    {
                         if (PMobSkill->getValidTargets() & TARGET_ENEMY)
                        {
                            PPetTarget = PTarget->targid;
//							printf("charentity.cpp onAbility TARGET ENEMY ID: [%i]\n", PPetTarget);
                        }
                    }
                }
                PPet->PAI->MobSkill(PPetTarget, PAbility->getMobSkillID());
//				printf("charentity.cpp onAbility MOVING TO MOB SKILL\n");
            }
        }
        //#TODO: make this generic enough to not require an if
        else if (PAbility->isAoE() && this->PParty != nullptr)
        {
            PAI->TargetFind->reset();

            float distance = PAbility->getRange();

            PAI->TargetFind->findWithinArea(this, AOERADIUS_ATTACKER, distance);

			auto totalTargets = (uint16)PAI->TargetFind->m_targets.size();

			PAbility->setTotalTargets(totalTargets);

            uint16 msg = 0;
            for (auto&& PTarget : PAI->TargetFind->m_targets)
            {
                actionList_t& actionList = action.getNewActionList();
                actionList.ActionTargetID = PTarget->id;
                actionTarget_t& actionTarget = actionList.getNewActionTarget();
                actionTarget.reaction = REACTION_NONE;
                actionTarget.speceffect = SPECEFFECT_NONE;
                actionTarget.animation = PAbility->getAnimationID();
                actionTarget.messageID = PAbility->getMessage();

                if (msg == 0) {
                    msg = PAbility->getMessage();
                }
                else {
                    msg = PAbility->getAoEMsg();
                }

                if (actionTarget.param < 0)
                {
                    msg = ability::GetAbsorbMessage(msg);
                    actionTarget.param = -actionTarget.param;
                }

                actionTarget.messageID = msg;
                actionTarget.param = luautils::OnUseAbility(this, PTarget, PAbility, &action);
				
				if (PTarget->objtype == TYPE_MOB)
				{
					// Trigger Treasure Hunter from AoE ability
					battleutils::ApplyTreasureHunter(this, PTarget, &actionTarget, false);
				}
            }
        }
        else
        {
            actionList_t& actionList = action.getNewActionList();
            actionList.ActionTargetID = PTarget->id;
            actionTarget_t& actionTarget = actionList.getNewActionTarget();
            actionTarget.reaction = REACTION_NONE;
            actionTarget.speceffect = SPECEFFECT_RECOIL;
            actionTarget.animation = PAbility->getAnimationID();
            actionTarget.param = 0;
            auto prevMsg = actionTarget.messageID;

            int32 value = luautils::OnUseAbility(this, PTarget, PAbility, &action);
            if (prevMsg == actionTarget.messageID) actionTarget.messageID = PAbility->getMessage();
            if (actionTarget.messageID == 0) actionTarget.messageID = MSGBASIC_USES_JA;
            actionTarget.param = value;

            if (value < 0)
            {
                actionTarget.messageID = ability::GetAbsorbMessage(actionTarget.messageID);
                actionTarget.param = -value;
            }


            //#TODO: move all of these to script!

            //// Super Jump
            //else if (PAbility->getID() == ABILITY_SUPER_JUMP)
            //{
            //    battleutils::jumpAbility(this, PTarget, 3);
            //    action.messageID = 0;
            //    this->loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, PTarget, PAbility->getID(), 0, MSGBASIC_USES_JA));
            //}

            //#TODO: move these 3 BST abilities to scripts
            //if (PAbility->getID() == ABILITY_GAUGE) {
            //    if (PTarget != nullptr && PTarget->objtype == TYPE_MOB) {
            //        if (((CMobEntity*)PTarget)->m_Type & MOBTYPE_NOTORIOUS ||
            //            PTarget->m_EcoSystem == SYSTEM_BEASTMEN ||
            //            PTarget->m_EcoSystem == SYSTEM_ARCANA)
            //        {
            //            //NM, Beastman or Arcana, cannot charm at all !
            //            this->pushPacket(new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_CANNOT_CHARM));
            //        }
            //        else {
            //            uint16 baseExp = charutils::GetRealExp(this->GetMLevel(), PTarget->GetMLevel());

            //            if (baseExp >= 400) {//IT
            //                this->pushPacket(new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_VERY_DIFFICULT_CHARM));
            //            }
            //            else if (baseExp >= 240) {//VT
            //                this->pushPacket(new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_DIFFICULT_TO_CHARM));
            //            }
            //            else if (baseExp >= 120) {//T
            //                this->pushPacket(new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_MIGHT_BE_ABLE_CHARM));
            //            }
            //            else if (baseExp >= 100) {//EM
            //                this->pushPacket(new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_SHOULD_BE_ABLE_CHARM));
            //            }
            //            else {
            //                this->pushPacket(new CMessageBasicPacket(this, PTarget, 0, 0, MSGBASIC_SHOULD_BE_ABLE_CHARM));
            //            }
            //        }
            //    }
            //}

            state.ApplyEnmity();
			
			if (PTarget->objtype == TYPE_MOB)
			{
				// Trigger Treasure Hunter from single target ability
				battleutils::ApplyTreasureHunter(this, PTarget, &actionTarget, false);
			}

            auto controller {static_cast<CPlayerController*>(PAI->GetController())};

            if (PTarget->isDead())
            {
                if (this->m_hasAutoTarget && PTarget->objtype == TYPE_MOB) // Auto-Target
                {
                    for (auto&& PPotentialTarget : this->SpawnMOBList)
                    {
                        if (PPotentialTarget.second->animation == ANIMATION_ATTACK &&
                            infront(this->loc.p, PPotentialTarget.second->loc.p, 64) &&
                            // facing(this->loc.p, PPotentialTarget.second->loc.p, 64) &&
                            distance(this->loc.p, PPotentialTarget.second->loc.p) <= 15)
                        {
                            std::unique_ptr<CBasicPacket> errMsg;
                            if (IsValidTarget(PPotentialTarget.second->targid, TARGET_ENEMY, errMsg))
                            {
                                controller->ChangeTarget(PPotentialTarget.second->targid);
                            }
                        }
                    }
                }
            }
        }
        PRecastContainer->Add(RECAST_ABILITY, PAbility->getRecastId(), action.recast);

        uint16 recastID = PAbility->getRecastId();
        if (map_config.blood_pact_shared_timer && (recastID == 173 || recastID == 174))
        {
            PRecastContainer->Add(RECAST_ABILITY, (recastID == 173 ? 174 : 173), action.recast);
        }

        pushPacket(new CCharRecastPacket(this));

        //#TODO: refactor
        //if (this->getMijinGakure())
        //{
        //    m_ActionType = ACTION_FALL;
        //    ActionFall();
        //}
    }
    else if (errMsg)
    {
        pushPacket(std::move(errMsg));
    }
}

void CCharEntity::OnRangedAttack(CRangeState& state, action_t& action)
{
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());
	auto PAttacker = static_cast<CBattleEntity*>(state.GetTarget());

    int32 damage = 0;
    int32 totalDamage = 0;

    action.id = id;
    action.actiontype = ACTION_RANGED_FINISH;

    actionList_t& actionList = action.getNewActionList();
    actionList.ActionTargetID = PTarget->id;

    actionTarget_t& actionTarget = actionList.getNewActionTarget();
    actionTarget.reaction = REACTION_HIT;		//0x10
    actionTarget.speceffect = SPECEFFECT_HIT;		//0x60 (SPECEFFECT_HIT + SPECEFFECT_RECOIL)
    actionTarget.messageID = 352;

    CItemWeapon* PItem = (CItemWeapon*)this->getEquip(SLOT_RANGED);
    CItemWeapon* PAmmo = (CItemWeapon*)this->getEquip(SLOT_AMMO);

    bool ammoThrowing = PAmmo ? PAmmo->isThrowing() : false;
    bool rangedThrowing = PItem ? PItem->isThrowing() : false;
    uint8 slot = SLOT_RANGED;

    if (ammoThrowing)
    {
        slot = SLOT_AMMO;
        PItem = nullptr;
    }
    if (rangedThrowing)
    {
        PAmmo = nullptr;
    }

    uint8 shadowsTaken = 0;
    uint8 hitCount = 1;			// 1 hit by default
    uint8 realHits = 0;			// to store the real number of hit for tp multipler
    auto ammoConsumed = 0;
    bool hitOccured = false;	// track if player hit mob at all
	bool isCritical = false;
    bool isSange = false;
    bool isBarrage = StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE, 0);
	bool followUpShot = false;
	bool isFirstShot = false;
	bool distanceSweetSpot = false;
	float damagePenalty = 0.0f;
	int16 rangedDelay = 0;

    // SU3/Raetic Weapon Follow-Up
    // https://www.bg-wiki.com/ffxi/Category:Superior_Equipment#Superior_3_(Su3)
    if (this->getMod(Mod::CONSUME_MP_FOR_FOLLOWUP_RANGED) > 0)
    {
        JOBTYPE mJob   = this->GetMJob();
        int16   maxMP  = this->health.maxmp + this->getMod(Mod::MP);
        int16   reqMP  = (int16)(maxMP * 0.05f);
        int16   currMP = this->health.mp;
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
            hitCount += 1;
            followUpShot = true;
            this->addMP(remMP);
        }
    }

    // SU3/Raetic Weapon Ranged Attack/Accuracy bonus
    // https://www.bg-wiki.com/ffxi/Category:Superior_Equipment#Superior_3_(Su3)
    if (this->getMod(Mod::CONSUME_MP_DURING_RANGED_ATK) > 0)
    {
        JOBTYPE mJob   = this->GetMJob();
        int16   maxMP  = this->health.maxmp + this->getMod(Mod::MP);
        int16   reqMP  = (int16)(maxMP * 0.02f);
        int16   currMP = this->health.mp;
        int16   remMP  = -(int16)(maxMP * 0.02f);
        int16   bonus  = (int16)(maxMP * 0.025f); // Jobs which natively have MP require 2,000 Max MP to receive +50 RATT

        // Jobs which do not natively have MP require 800 Max MP to receive +50 RATT
        switch (mJob)
        {
            case JOB_WAR:   bonus = (int16)(maxMP * 0.0625f);   break;
            case JOB_MNK:   bonus = (int16)(maxMP * 0.0625f);   break;
            case JOB_THF:   bonus = (int16)(maxMP * 0.0625f);   break;
            case JOB_BST:   bonus = (int16)(maxMP * 0.0625f);   break;
            case JOB_BRD:   bonus = (int16)(maxMP * 0.0625f);   break;
            case JOB_RNG:   bonus = (int16)(maxMP * 0.0625f);   break;
            case JOB_SAM:   bonus = (int16)(maxMP * 0.0625f);   break;
            case JOB_NIN:   bonus = (int16)(maxMP * 0.0625f);   break;
            case JOB_DRG:   bonus = (int16)(maxMP * 0.0625f);   break;
            case JOB_COR:   bonus = (int16)(maxMP * 0.0625f);   break;
            case JOB_PUP:   bonus = (int16)(maxMP * 0.0625f);   break;
            case JOB_DNC:   bonus = (int16)(maxMP * 0.0625f);   break;
            default: break;
        }

        if (currMP >= reqMP)
        {
            this->addMP(remMP);
            this->setModifier(Mod::CONSUME_MP_RATT_RACC_BONUS, bonus);
        }
    }

    // if barrage is detected, getBarrageShotCount also checks for ammo count
    if (!ammoThrowing && !rangedThrowing && isBarrage)
    {
        hitCount += battleutils::getBarrageShotCount(this);
    }
    else if (ammoThrowing && this->StatusEffectContainer->HasStatusEffect(EFFECT_SANGE))
    {
        isSange = true;
        hitCount += getMod(Mod::UTSUSEMI);
    }

	// Ranged attack distance correction variables
	uint16 trueShot = this->getMod(Mod::TRUE_SHOT);
	float rangedDistance = distance(this->loc.p, PTarget->loc.p); //m_attacker, m_victim
	float distanceCorrection = 1.00f + float(trueShot / 100.00f);
	
	// Eliminates distance correction if Enhances "Unlimited Shot" is found
	if (this->StatusEffectContainer->HasStatusEffect(EFFECT_UNLIMITED_SHOT) && this->getMod(Mod::ENH_UNLIMITED_SHOT) > 0)
	{
		rangedDistance = 11.5f;
	}

    // loop for barrage hits, if a miss occurs, the loop will end
    for (uint8 i = 1; i <= hitCount; ++i)
    {
        if (PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE, 0))
        {
            actionTarget.messageID = 32;
            actionTarget.reaction = REACTION_EVADE;
            actionTarget.speceffect = SPECEFFECT_NONE;
            hitCount = i; // end barrage, shot missed
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
                isCritical = tpzrand::GetRandomNumber(100) < battleutils::GetCritHitRate(this, PTarget, true);
				
                float pdif = battleutils::GetRangedDamageRatio(this, PTarget, isCritical);

                if (isCritical)
                {
                    actionTarget.speceffect = SPECEFFECT_CRITICAL_HIT;
                    actionTarget.messageID = 353;
                }

                // at least 1 hit occured
                hitOccured = true;
                realHits++;

				if (i == 1)
				{
					isFirstShot = true;
				}

                if (isSange)
                {
                    // change message to sange
                    actionTarget.messageID = 77;
                }

                damage = (int32)((this->GetRangedWeaponDmg() + battleutils::GetFSTR(this, PTarget, slot)) * pdif);

                // printf("charentity.cpp OnRangedAttack  DAMAGE: [%i] = RANGED WEAPON DAMAGE: [%i] + fSTR: [%i] * pDIF: [%1.4f]\n", damage, this->GetRangedWeaponDmg(), battleutils::GetFSTR(this, PTarget, slot), pdif);

				// Ranged attack distance correction ideal distances
				// https://www.bg-wiki.com/ffxi/Distance_Correction
				// https://ffxiclopedia.fandom.com/wiki/Distance
				// TODO: Check for target model size and increase allowable distance
				
				// Throwing (Ranged or Ammo slot)
				if (rangedThrowing == true || ammoThrowing == true)
				{
					if (rangedDistance >= 1.0f && rangedDistance <= 3.5f)
					{
						damage = (int32)(damage * distanceCorrection);
						distanceSweetSpot = true;
					}
					else if (rangedDistance > 3.5f)
					{
						damagePenalty = (100.0f - rangedDistance) / 100.0f;
						damage = (int32)(damage * damagePenalty);
					}

                    if (PAmmo && PAmmo->getSubSkillType() == SUBSKILL_SHURIKEN)
                    {
                        float shurikenBonus = luautils::GetSettingsVariable("SHURIKEN_DMG_BONUS");

                        // printf("charentity.cpp OnRangedAttack  THROWING DMG: [%i] = BASE: [%i] * SHURIKEN DMG BONUS: [%1.4f]\n", (int32)(damage * shurikenBonus), damage, shurikenBonus);

                        damage = (uint32)(damage * shurikenBonus);
                    }
				}
				
				if (PItem != nullptr && PItem->getSkillType() == SKILL_MARKSMANSHIP)
				{
					rangedDelay = ((PItem->getDelay() * 60) / 1000);
					
					// Marksmanship (Crossbow)
					if (rangedDelay <= 436)
					{
						if (rangedDistance >= 8.5f && rangedDistance <= 12.5f)
						{
							damage = (int32)(damage * distanceCorrection);
							distanceSweetSpot = true;
						}
						else if (rangedDistance < 8.5f)
						{
							damagePenalty = (100.0f - (40.0f - std::clamp(rangedDistance * 5.0f, 6.5f, 35.0f))) / 100.0f;
							damage = (int32)(damage * damagePenalty);
						}
						else if (rangedDistance >= 12.5f)
						{
							damagePenalty = (100.0f - std::clamp(rangedDistance * 0.7f, 5.0f, 14.0f)) / 100.0f;
							damage = (int32)(damage * damagePenalty);
						}
					}
					
					//Marksmanship (Gun)
					if (rangedDelay >= 466)
					{
						if (rangedDistance >= 5.5f && rangedDistance <= 7.5f)
						{
							damage = (int32)(damage * distanceCorrection);
							distanceSweetSpot = true;
						}
						else if (rangedDistance < 5.5f)
						{
							damagePenalty = (100.0f - (30.0f - std::clamp(rangedDistance * 5.0f, 5.0f, 25.0f))) / 100.0f;
							damage = (int32)(damage * damagePenalty);
						}
						else if (rangedDistance > 7.5f)
						{
							damagePenalty = (100.0f - std::clamp(rangedDistance * 5.6f, 5.0f, 15.0f)) / 100.0f;
							damage = (int32)(damage * damagePenalty);
						}
					}
				}
				
				if (PItem != nullptr && PItem->getSkillType() == SKILL_ARCHERY)
				{
					rangedDelay = ((PItem->getDelay() * 60) / 1000);
					
					// Archery (Shortbow)
					if (rangedDelay <= 436)
					{
						if (rangedDistance >= 7.0f && rangedDistance <= 10.0f)
						{
							damage = (int32)(damage * distanceCorrection);
							distanceSweetSpot = true;
						}
						else if (rangedDistance < 7.0f)
						{
							damagePenalty = (100.0f - (40.0f - std::clamp(rangedDistance * 5.0f, 5.5f, 35.0f))) / 100.0f;
							damage = (int32)(damage * damagePenalty);
						}
						else if (rangedDistance > 10.0f)
						{
							damagePenalty = (100.0f - std::clamp(rangedDistance * 0.52f, 1.0f, 13.0f)) / 100.0f;
							damage = (int32)(damage * damagePenalty);
						}
					}
						
					// Archery (Longbow)
					if (rangedDelay >= 466)
					{
						if (rangedDistance >= 10.5f && rangedDistance <= 13.5f)
						{
							damage = (int32)(damage * distanceCorrection);
							distanceSweetSpot = true;
						}
						else if (rangedDistance < 10.5f)
						{
							damagePenalty = (100.0f - (40.0f - std::clamp(rangedDistance * 5.0f, 5.5f, 35.0f))) / 100.0f;
							damage = (int32)(damage * damagePenalty);
						}
						else if (rangedDistance > 13.5f)
						{
							damagePenalty = (100.0f - std::clamp(rangedDistance * 0.52f, 1.0f, 13.0f)) / 100.0f;
							damage = (int32)(damage * damagePenalty);
						}
					}
				}

                if (slot == SLOT_RANGED)
                {
                    if (state.IsRapidShot())
                    {
                        damage = attackutils::CheckForDamageMultiplier(this, PItem, damage, PHYSICAL_ATTACK_TYPE::RAPID_SHOT, SLOT_RANGED);
                    }
                    else
                    {
                        damage = attackutils::CheckForDamageMultiplier(this, PItem, damage, PHYSICAL_ATTACK_TYPE::RANGED, SLOT_RANGED);
                    }

                    if (PItem != nullptr)
                    {
                        charutils::TrySkillUP(this, (SKILLTYPE)PItem->getSkillType(), PTarget->GetMLevel());
                    }
                }
                else if (slot == SLOT_AMMO && PAmmo != nullptr)
                {
                    charutils::TrySkillUP(this, (SKILLTYPE)PAmmo->getSkillType(), PTarget->GetMLevel());
                }
            }
        }
        else //miss
        {
            actionTarget.reaction = REACTION_EVADE;
            actionTarget.speceffect = SPECEFFECT_NONE;
            actionTarget.messageID = 354;
            hitCount = i; // end barrage, shot missed
        }

        // check for recycle chance
        uint16 recycleChance = getMod(Mod::RECYCLE);
        if (charutils::hasTrait(this, TRAIT_RECYCLE))
        {
            recycleChance += PMeritPoints->GetMeritValue(MERIT_RECYCLE, this);
        }

        // Only remove Unlimited Shot on hit
        if (hitOccured && this->StatusEffectContainer->HasStatusEffect(EFFECT_UNLIMITED_SHOT))
        {
            StatusEffectContainer->DelStatusEffect(EFFECT_UNLIMITED_SHOT);
            recycleChance = 100;
        }

		// Only remove Flashy Shot on hit
        if (hitOccured && this->StatusEffectContainer->HasStatusEffect(EFFECT_FLASHY_SHOT))
        {
            StatusEffectContainer->DelStatusEffect(EFFECT_FLASHY_SHOT);
        }
		
		// Only remove Stealth Shot on hit
        if (hitOccured && this->StatusEffectContainer->HasStatusEffect(EFFECT_STEALTH_SHOT))
        {
            StatusEffectContainer->DelStatusEffect(EFFECT_STEALTH_SHOT);
        }
		
		// Add Double Shot ammunition cost
		if (this->getMod(Mod::DOUBLE_SHOT_AMMO) == 1)
		{
			++ammoConsumed;
		}
		
		// Add Double Shot becomes Triple Shot ammunition cost
		if (this->getMod(Mod::DOUBLE_SHOT_AMMO) == 2)
		{
			++ammoConsumed;
			++ammoConsumed;
		}
		
		// Add Triple Shot ammunition cost
		if (this->getMod(Mod::TRIPLE_SHOT_AMMO) == 2)
		{
			++ammoConsumed;
			++ammoConsumed;
		}
		
		// Add Triple Shot becomes Quad Shot ammunition cost
		if (this->getMod(Mod::TRIPLE_SHOT_AMMO) == 3)
		{
			++ammoConsumed;
			++ammoConsumed;
			++ammoConsumed;
		}

        if (PAmmo != nullptr && tpzrand::GetRandomNumber(100) > recycleChance)
        {
            ++ammoConsumed;
            TrackArrowUsageForScavenge(PAmmo);
            if (PAmmo->getQuantity() == i)
            {
                hitCount = i;
            }
        }
        totalDamage += damage;
    }

    // if a hit did occur (even without barrage)
    if (hitOccured == true)
    {
        // any misses with barrage cause remaing shots to miss, meaning we must check Action.reaction
        if (actionTarget.reaction == REACTION_EVADE && (this->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE) || isSange))
        {
            actionTarget.messageID = 352;
            actionTarget.reaction = REACTION_HIT;
            actionTarget.speceffect = SPECEFFECT_CRITICAL_HIT;
        }
		
		// 576 - Ranged attack strikes squarely
		// 577 - Ranged attack strikes true, pummeling
		if (distanceSweetSpot == true && isCritical == false)
		{
			actionTarget.messageID = 577;
		}
		else if (distanceSweetSpot == false && isCritical == false)
		{
			actionTarget.messageID = 576;
		}

        PHYSICAL_ATTACK_TYPE physAtkType = PHYSICAL_ATTACK_TYPE::RANGED;

        if (followUpShot == true)
        {
            physAtkType = PHYSICAL_ATTACK_TYPE::FOLLOWUP;
        }

        actionTarget.param = battleutils::TakePhysicalDamage(this, PTarget, physAtkType, totalDamage, false, slot, realHits, nullptr, true, true);

        // lower damage based on shadows taken
        if (shadowsTaken)
            actionTarget.param = (int32)(actionTarget.param * (1 - ((float)shadowsTaken / realHits)));

        // absorb message
        if (actionTarget.param < 0)
        {
            actionTarget.param = -(actionTarget.param);
            actionTarget.messageID = 382;
        }

        //add additional effects
        //this should go AFTER damage taken
        //or else sleep effect won't work
        //battleutils::HandleRangedAdditionalEffect(this,PTarget,&Action);
        //TODO: move all hard coded additional effect ammo to scripts
        if ((PAmmo != nullptr && battleutils::GetScaledItemModifier(this, PAmmo, Mod::ADDITIONAL_EFFECT) > 0) ||
            (PItem != nullptr && battleutils::GetScaledItemModifier(this, PItem, Mod::ADDITIONAL_EFFECT) > 0)) {}
        luautils::OnAdditionalEffect(this, PTarget, (PAmmo != nullptr ? PAmmo : PItem), &actionTarget, totalDamage);
		
		// Treasure Hunter only applies on the first shot
		if (isFirstShot == true && actionTarget.param > 0)
		{
			// Trigger Treasure Hunter from ranged attack
			battleutils::ApplyTreasureHunter(this, PTarget, &actionTarget, true);
		}
    }
    else if (shadowsTaken > 0)
    {
        // shadows took damage
        actionTarget.messageID = 0;
        actionTarget.reaction = REACTION_EVADE;
        PTarget->loc.zone->PushPacket(PTarget, CHAR_INRANGE_SELF, new CMessageBasicPacket(PTarget, PTarget, 0, shadowsTaken, MSGBASIC_SHADOW_ABSORB));
    }

    if (actionTarget.speceffect == SPECEFFECT_HIT && actionTarget.param > 0)
        actionTarget.speceffect = SPECEFFECT_RECOIL;

    // remove barrage effect if present
    if (this->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE, 0)) {
        StatusEffectContainer->DelStatusEffect(EFFECT_BARRAGE, 0);
    }
    else if (isSange)
    {
        uint16 power = StatusEffectContainer->GetStatusEffect(EFFECT_SANGE)->GetPower();

        // remove shadows
        while (realHits-- && tpzrand::GetRandomNumber(100) <= power && battleutils::IsAbsorbByShadow(this));

        StatusEffectContainer->DelStatusEffect(EFFECT_SANGE);
    }
    battleutils::ClaimMob(PTarget, this);
    battleutils::RemoveAmmo(this, ammoConsumed);
	
	if (this->getMod(Mod::DOUBLE_SHOT_AMMO) == 1)
	{
		this->delModifier(Mod::DOUBLE_SHOT_AMMO, 1);
	}
	if (this->getMod(Mod::DOUBLE_SHOT_AMMO) == 2)
	{
		this->delModifier(Mod::DOUBLE_SHOT_AMMO, 2);
	}
	if (this->getMod(Mod::TRIPLE_SHOT_AMMO) == 2)
	{
		this->delModifier(Mod::TRIPLE_SHOT_AMMO, 2);
	}
	if (this->getMod(Mod::TRIPLE_SHOT_AMMO) == 3)
	{
		this->delModifier(Mod::TRIPLE_SHOT_AMMO, 3);
	}
	
    // only remove detectables
    StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);

    // Try to double shot
    //#TODO: figure out the packet structure of double/triple shot
    //if (this->StatusEffectContainer->HasStatusEffect(EFFECT_DOUBLE_SHOT, 0) && !this->secondDoubleShotTaken &&	!isBarrage && !isSange)
    //{
    //    uint16 doubleShotChance = getMod(Mod::DOUBLE_SHOT_RATE);
    //    if (tpzrand::GetRandomNumber(100) < doubleShotChance)
    //    {
    //        this->secondDoubleShotTaken = true;
    //        m_ActionType = ACTION_RANGED_FINISH;
    //        this->m_rangedDelay = 0;
    //        return;
    //    }
    //}
}

bool CCharEntity::IsMobOwner(CBattleEntity* PBattleTarget)
{
    TPZ_DEBUG_BREAK_IF(PBattleTarget == nullptr);

    if (PBattleTarget->m_OwnerID.id == 0 || PBattleTarget->m_OwnerID.id == this->id || PBattleTarget->objtype == TYPE_PC)
    {
        return true;
    }

    bool found = false;

    static_cast<CCharEntity*>(this)->ForAlliance([&PBattleTarget, &found](CBattleEntity* PEntity) {
        if (PEntity->id == PBattleTarget->m_OwnerID.id)
        {
            found = true;
        }
    });

    return found;
}

void CCharEntity::HandleErrorMessage(std::unique_ptr<CBasicPacket>& msg)
{
    if (msg && !isCharmed)
        pushPacket(msg.release());
}

void CCharEntity::OnDeathTimer()
{
    charutils::HomePoint(this);
}

void CCharEntity::OnRaise()
{
    // TODO: Moghancement Experience needs to be factored in here somewhere.
    if (m_hasRaise > 0)
    {
        uint8 weaknessLvl = 1;
        if (StatusEffectContainer->HasStatusEffect(EFFECT_WEAKNESS))
        {
            //double weakness!
            weaknessLvl = 2;
        }

        //add weakness effect (75% reduction in HP/MP)
        if (GetLocalVar("MijinGakure") == 0)
        {
            CStatusEffect* PWeaknessEffect = new CStatusEffect(EFFECT_WEAKNESS, EFFECT_WEAKNESS, weaknessLvl, 0, 300);
            StatusEffectContainer->AddStatusEffect(PWeaknessEffect);
        }

        double ratioReturned = 0.0f;
        uint16 hpReturned = 1;

        action_t action;
        action.id = id;
        action.actiontype = ACTION_RAISE_MENU_SELECTION;
        auto& list = action.getNewActionList();
        auto& actionTarget = list.getNewActionTarget();

        list.ActionTargetID = id;
        // Mijin Gakure used with MIJIN_RERAISE MOD
        if (GetLocalVar("MijinGakure") != 0 && getMod(Mod::MIJIN_RERAISE) != 0)
        {
            actionTarget.animation = 511;
            hpReturned = (uint16)(GetMaxHP());
        }
        else if (m_hasRaise == 1)
        {
            actionTarget.animation = 511;
            hpReturned = (uint16)((GetLocalVar("MijinGakure") != 0) ? GetMaxHP() * 0.5 : GetMaxHP() * 0.1);
            ratioReturned = 0.50f * (1 - map_config.exp_retain);
        }
        else if (m_hasRaise == 2)
        {
            actionTarget.animation = 512;
            hpReturned = (uint16)((GetLocalVar("MijinGakure") != 0) ? GetMaxHP() * 0.5 : GetMaxHP() * 0.25);
            ratioReturned = ((GetMLevel() <= 50) ? 0.50f : 0.75f) * (1 - map_config.exp_retain);
        }
        else if (m_hasRaise == 3)
        {
            actionTarget.animation = 496;
            hpReturned = (uint16)(GetMaxHP() * 0.5);
            ratioReturned = ((GetMLevel() <= 50) ? 0.50f : 0.90f) * (1 - map_config.exp_retain);
        }
        addHP(((hpReturned < 1) ? 1 : hpReturned));
        updatemask |= UPDATE_HP;
        actionTarget.speceffect = SPECEFFECT_RAISE;

        loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CActionPacket(action));

        uint8 mLevel = (m_LevelRestriction != 0 && m_LevelRestriction < GetMLevel()) ? m_LevelRestriction : GetMLevel();
        uint16 expLost = mLevel <= 67 ? (charutils::GetExpNEXTLevel(mLevel) * 8) / 100 : 2400;

        uint16 xpNeededToLevel = charutils::GetExpNEXTLevel(jobs.job[GetMJob()]) - jobs.exp[GetMJob()];

        // Exp is enough to level you and (you're not under a level restriction, or the level restriction is higher than your current main level).
        if (xpNeededToLevel < expLost && (m_LevelRestriction == 0 || GetMLevel() < m_LevelRestriction))
        {
            // Player probably leveled down when they died.  Give they xp for the next level.
            expLost = GetMLevel() <= 67 ? (charutils::GetExpNEXTLevel(jobs.job[GetMJob()] + 1) * 8) / 100 : 2400;
        }

        uint16 xpReturned = (uint16)(ceil(expLost * ratioReturned));

        if (GetLocalVar("MijinGakure") == 0 && GetMLevel() >= map_config.exp_loss_level)
        {
            charutils::AddExperiencePoints(true, this, this, xpReturned);
        }

        SetLocalVar("MijinGakure", 0);

        m_hasRaise = 0;
    }
}

void CCharEntity::OnItemFinish(CItemState& state, action_t& action)
{
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());
    auto PItem = static_cast<CItemUsable*>(state.GetItem());

    //#TODO: I'm sure this is supposed to be in the action packet... (animation, message)
    if (PItem->getAoE())
    {
        PTarget->ForParty([PItem, PTarget](CBattleEntity* PMember)
        {
            if (!PMember->isDead() && distance(PTarget->loc.p, PMember->loc.p) <= 10)
            {
                luautils::OnItemUse(PMember, PItem);
            }
        });
    }
    else
    {
        luautils::OnItemUse(PTarget, PItem);
    }

    action.id = this->id;
    action.actiontype = ACTION_ITEM_FINISH;
    action.actionid = PItem->getID();

    actionList_t& actionList = action.getNewActionList();
    actionList.ActionTargetID = PTarget->id;

    actionTarget_t& actionTarget = actionList.getNewActionTarget();
    actionTarget.animation = PItem->getAnimationID();

    if (PItem->isType(ITEM_EQUIPMENT))
    {
        if (PItem->getMaxCharges() > 1)
        {
            PItem->setCurrentCharges(PItem->getCurrentCharges() - 1);
        }
        PItem->setLastUseTime(CVanaTime::getInstance()->getVanaTime());

        char extra[sizeof(PItem->m_extra) * 2 + 1];
        Sql_EscapeStringLen(SqlHandle, extra, (const char*)PItem->m_extra, sizeof(PItem->m_extra));

        const char* Query =
            "UPDATE char_inventory "
            "SET extra = '%s' "
            "WHERE charid = %u AND location = %u AND slot = %u;";

        Sql_Query(
            SqlHandle,
            Query,
            extra,
            this->id,
            PItem->getLocationID(),
            PItem->getSlotID());

        if (PItem->getCurrentCharges() != 0)
        {
            this->PRecastContainer->Add(RECAST_ITEM, PItem->getSlotID() << 8 | PItem->getLocationID(), PItem->getReuseTime() / 1000); // add recast timer to Recast List from any bag
        }
    }
    else // разблокируем все предметы, кроме экипирвоки
    {
        PItem->setSubType(ITEM_UNLOCKED);

        charutils::UpdateItem(this, PItem->getLocationID(), PItem->getSlotID(), -1, true);
    }
}

CBattleEntity* CCharEntity::IsValidTarget(uint16 targid, uint16 validTargetFlags, std::unique_ptr<CBasicPacket>& errMsg)
{
    auto PTarget = CBattleEntity::IsValidTarget(targid, validTargetFlags, errMsg);
    if (PTarget)
    {
        if (PTarget->objtype == TYPE_PC && charutils::IsAidBlocked(this, static_cast<CCharEntity*>(PTarget)))
        {
//			printf("charentity.cpp IsValidTarget BLOCKAID ENABLED PC\n");
            // Target is blocking assistance
            errMsg = std::make_unique<CMessageSystemPacket>(0, 0, 225);
            // Interaction was blocked
            static_cast<CCharEntity*>(PTarget)->pushPacket(new CMessageSystemPacket(0, 0, 226));
        }
        else if (static_cast<CCharEntity*>(this)->IsMobOwner(PTarget))
        {
            if (PTarget->isAlive() || (validTargetFlags & TARGET_PLAYER_DEAD) != 0)
            {
//				printf("charentity.cpp IsValidTarget TARGET IS ALIVE\n");
                return PTarget;
            }
            else
            {
//				printf("charentity.cpp IsValidTarget ERROR CANNOT PERFORM ACTION ON THAT TARGET\n");
                errMsg = std::make_unique<CMessageBasicPacket>(this, this, 0, 0, MSGBASIC_CANNOT_ON_THAT_TARG);
            }
        }
        else
        {
//			printf("charentity.cpp IsValidTarget TARGET ALREADY CLAIMED\n");
            errMsg = std::make_unique<CMessageBasicPacket>(this, PTarget, 0, 0, MSGBASIC_ALREADY_CLAIMED);
        }
    }
    else
    {
//		printf("charentity.cpp IsValidTarget CANNOT ATTACK THAT TARGET\n");
        errMsg = std::make_unique<CMessageBasicPacket>(this, this, 0, 0, MSGBASIC_CANNOT_ATTACK_TARGET);
    }
//	printf("charentity.cpp IsValidTarget NO TARGET RETURNING NULLPTR\n");
    return nullptr;
}

void CCharEntity::Die()
{
    if (PLastAttacker)
        loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(PLastAttacker, this, 0, 0, MSGBASIC_PLAYER_DEFEATED_BY));
    else
        loc.zone->PushPacket(this, CHAR_INRANGE_SELF, new CMessageBasicPacket(this, this, 0, 0, MSGBASIC_FALLS_TO_GROUND));

    battleutils::RelinquishClaim(this);
	
	// Floor the dying char's enmity
	if (PLastAttacker && PLastAttacker->objtype == TYPE_MOB)
	{
		((CMobEntity*)PLastAttacker)->PEnmityContainer->LowerEnmityByPercent(this, 99, nullptr);
	}
	
	if (this->PPet != nullptr)
	{
		if (!this->PPet->isCharmed)
		{
			petutils::DespawnPet(this);
		}
	}
	
    Die(death_duration);
    SetDeathTimestamp((uint32)time(nullptr));

    setBlockingAid(false);

    // Influence for conquest system
    conquest::LoseInfluencePoints(this);

    if (GetLocalVar("MijinGakure") == 0)
    {
        float retainPercent = std::clamp(map_config.exp_retain + getMod(Mod::EXPERIENCE_RETAINED) / 100.0f, 0.0f, 1.0f);
        charutils::DelExperiencePoints(this, retainPercent, 0);
    }
	
	// Tracks the number of deaths the char has suffered
	if (charutils::GetCharVar(this, "TotalDeaths") == 0)
	{
		charutils::SetCharVar(this, "TotalDeaths", 1);
	}
	else
	{
		charutils::SetCharVar(this, "TotalDeaths", charutils::GetCharVar(this, "TotalDeaths") + 1);
	}
	
	// Resets the !godmode and !minigodmode character variables so they don't have to be toggled
	if (charutils::GetCharVar(this, "GodMode") == 1 || charutils::GetCharVar(this, "MiniGodMode") == 1)
	{
		charutils::SetCharVar(this, "GodMode", 0);
		charutils::SetCharVar(this, "MiniGodMode", 0);
	}
}

void CCharEntity::Die(duration _duration)
{
    this->ClearTrusts();

    m_deathSyncTime = server_clock::now() + death_update_frequency;
    PAI->ClearStateStack();
    PAI->Internal_Die(_duration);

    // If player allegiance is not reset on death they will auto-homepoint
    allegiance = ALLEGIANCE_PLAYER;

    // reraise modifiers
    if (this->getMod(Mod::RERAISE_I) > 0)
        m_hasRaise = 1;

    if (this->getMod(Mod::RERAISE_II) > 0)
        m_hasRaise = 2;

    if (this->getMod(Mod::RERAISE_III) > 0)
        m_hasRaise = 3;
    // MIJIN_RERAISE checks
    if (m_hasRaise == 0 && this->getMod(Mod::MIJIN_RERAISE) > 0)
        m_hasRaise = 1;

    CBattleEntity::Die();
}

void CCharEntity::Raise()
{
    PAI->Internal_Raise();
    SetDeathTimestamp(0);
}

void CCharEntity::SetDeathTimestamp(uint32 timestamp)
{
    m_DeathTimestamp = timestamp;
}

int32 CCharEntity::GetSecondsElapsedSinceDeath()
{
    return m_DeathTimestamp > 0 ? (uint32)time(nullptr) - m_DeathTimestamp : 0;
}

int32 CCharEntity::GetTimeRemainingUntilDeathHomepoint()
{
    // 0x0003A020 is 60 * 3960 and 3960 is 66 minutes in seconds
    // The client uses this time as the maximum amount of time for death
    // We convert the elapsed death time to this total time and subtract it which gives us the remaining time to a forced homepoint
    // Once the returned value here reaches below 360 then the client with force homepoint the character
    return 0x0003A020 - (60 * GetSecondsElapsedSinceDeath());
}


int32 CCharEntity::GetTimeCreated()
{
    const char* fmtQuery = "SELECT UNIX_TIMESTAMP(timecreated) FROM chars WHERE charid = %u;";

    int32 ret = Sql_Query(SqlHandle, fmtQuery, id);

    if (ret != SQL_ERROR &&
        Sql_NumRows(SqlHandle) != 0 &&
        Sql_NextRow(SqlHandle) == SQL_SUCCESS)
    {
        return Sql_GetIntData(SqlHandle, 0);
    }
    
    return 0;
}

bool CCharEntity::hasMoghancement(uint16 moghancementID)
{
    return m_moghancementID == moghancementID;
}

void CCharEntity::UpdateMoghancement()
{
    // Add up all of the installed furniture auras
    std::array<uint16, 8> elements = { 0 };
    for (auto containerID : {LOC_MOGSAFE, LOC_MOGSAFE2})
    {
        CItemContainer* PContainer = getStorage(containerID);
        for (int slotID = 1; slotID <= PContainer->GetSize(); ++slotID)
        {
            CItem* PItem = PContainer->GetItem(slotID);
            if (PItem != nullptr && PItem->isType(ITEM_FURNISHING))
            {
                CItemFurnishing* PFurniture = static_cast<CItemFurnishing*>(PItem);
                if (PFurniture->isInstalled())
                {
                    elements[PFurniture->getElement() - 1] += PFurniture->getAura();
                }
            }
        }
    }

    // Determine the dominant aura
    uint8 dominantElement = 0;
    uint16 dominantAura = 0;
    bool hasTiedElements = false;
    for (uint8 elementID = 1; elementID < 9; ++elementID)
    {
        uint16 aura = elements[elementID - 1];
        if (aura > dominantAura)
        {
            dominantElement = elementID;
            dominantAura = aura;
            hasTiedElements = false;
        }
        else if (aura == dominantAura)
        {
            hasTiedElements = true;
        }
    }

    // Determine which moghancement to use from the dominant element
    uint8 bestAura = 0;
    uint8 bestOrder = 255;
    uint16 newMoghancementID = 0;
    if (!hasTiedElements && dominantAura > 0)
    {
        for (auto containerID : { LOC_MOGSAFE, LOC_MOGSAFE2 })
        {
            CItemContainer* PContainer = getStorage(containerID);
            for (int slotID = 1; slotID <= PContainer->GetSize(); ++slotID)
            {
                CItem* PItem = PContainer->GetItem(slotID);
                if (PItem != nullptr && PItem->isType(ITEM_FURNISHING))
                {
                    CItemFurnishing* PFurniture = static_cast<CItemFurnishing*>(PItem);
                    // If aura is tied then use whichever furniture was placed most recently
                    if (PFurniture->isInstalled() &&
                        PFurniture->getElement() == dominantElement &&
                        (PFurniture->getAura() > bestAura || (PFurniture->getAura() == bestAura && PFurniture->getOrder() < bestOrder)))
                    {
                        bestAura = PFurniture->getAura();
                        bestOrder = PFurniture->getOrder();
                        newMoghancementID = PFurniture->getMoghancement();
                    }
                }
            }
        }
    }

    // Always show which moghancement the player has if they have one at all
    if (newMoghancementID != 0)
    {
        pushPacket(new CMessageSpecialPacket(this, luautils::GetTextIDVariable(getZone(), "KEYITEM_OBTAINED"), newMoghancementID, 0, 0, 0, 0));
    }

    if (newMoghancementID != m_moghancementID)
    {
        // Remove the previous moghancement
        if (m_moghancementID != 0)
            charutils::delKeyItem(this, m_moghancementID);

        // Add the new moghancement
        if (newMoghancementID != 0)
            charutils::addKeyItem(this, newMoghancementID);

        // Send only one key item packet if they are in the same key item table
        uint8 newTable = newMoghancementID >> 9;
        uint8 currentTable = m_moghancementID >> 9;
        if (newTable == currentTable)
        {
            pushPacket(new CKeyItemsPacket(this, (KEYS_TABLE)newTable));
        }
        else
        {
            if (newTable != 0)
                pushPacket(new CKeyItemsPacket(this, (KEYS_TABLE)newTable));
            if (currentTable != 0)
                pushPacket(new CKeyItemsPacket(this, (KEYS_TABLE)currentTable));
        }
        charutils::SaveKeyItems(this);

        SetMoghancement(newMoghancementID);
        charutils::SaveCharMoghancement(this);
    }
}

void CCharEntity::SetMoghancement(uint16 moghancementID)
{
    m_moghancementID = moghancementID;

    // Apply the moghancement
    if (m_moghancementID != 0)
    {
        switch (m_moghancementID)
        {
            case MOGHANCEMENT_FIRE:
                addModifier(Mod::SYNTH_FAIL_RATE_FIRE, 5);
                break;
            case MOGHANCEMENT_ICE:
                addModifier(Mod::SYNTH_FAIL_RATE_ICE, 5);
                break;
            case MOGHANCEMENT_WIND:
                addModifier(Mod::SYNTH_FAIL_RATE_WIND, 5);
                break;
            case MOGHANCEMENT_EARTH:
                addModifier(Mod::SYNTH_FAIL_RATE_EARTH, 5);
                break;
            case MOGHANCEMENT_LIGHTNING:
                addModifier(Mod::SYNTH_FAIL_RATE_LIGHTNING, 5);
                break;
            case MOGHANCEMENT_WATER:
                addModifier(Mod::SYNTH_FAIL_RATE_WATER, 5);
                break;
            case MOGHANCEMENT_LIGHT:
                addModifier(Mod::SYNTH_FAIL_RATE_LIGHT, 5);
                break;
            case MOGHANCEMENT_DARK:
                addModifier(Mod::SYNTH_FAIL_RATE_DARK, 5);
                break;

            case MOGHANCEMENT_FISHING:
                addModifier(Mod::FISH, 1);
                break;
            case MOGHANCEMENT_WOODWORKING:
                addModifier(Mod::WOOD, 1);
                break;
            case MOGHANCEMENT_SMITHING:
                addModifier(Mod::SMITH, 1);
                break;
            case MOGHANCEMENT_GOLDSMITHING:
                addModifier(Mod::GOLDSMITH, 1);
                break;
            case MOGHANCEMENT_CLOTHCRAFT:
                addModifier(Mod::CLOTH, 1);
                break;
            case MOGHANCEMENT_LEATHERCRAFT:
                addModifier(Mod::LEATHER, 1);
                break;
            case MOGHANCEMENT_BONECRAFT:
                addModifier(Mod::BONE, 1);
                break;
            case MOGHANCEMENT_ALCHEMY:
                addModifier(Mod::ALCHEMY, 1);
                break;
            case MOGHANCEMENT_COOKING:
                addModifier(Mod::COOK, 1);
                break;

            case MOGLIFICATION_FISHING:
                addModifier(Mod::FISH, 1);
                // TODO: "makes it slightly easier to reel in your catch"
                break;
            case MOGLIFICATION_WOODWORKING:
                addModifier(Mod::WOOD, 1);
                break;
            case MOGLIFICATION_SMITHING:
                addModifier(Mod::SMITH, 1);
                break;
            case MOGLIFICATION_GOLDSMITHING:
                addModifier(Mod::GOLDSMITH, 1);
                break;
            case MOGLIFICATION_CLOTHCRAFT:
                addModifier(Mod::CLOTH, 1);
                break;
            case MOGLIFICATION_LEATHERCRAFT:
                addModifier(Mod::LEATHER, 1);
                break;
            case MOGLIFICATION_BONECRAFT:
                addModifier(Mod::BONE, 1);
                break;
            case MOGLIFICATION_ALCHEMY:
                addModifier(Mod::ALCHEMY, 1);
                break;
            case MOGLIFICATION_COOKING:
                addModifier(Mod::COOK, 1);
                break;

            case MEGA_MOGLIFICATION_FISHING:
                addModifier(Mod::FISH, 5);
                break;
            case MEGA_MOGLIFICATION_WOODWORKING:
                addModifier(Mod::WOOD, 5);
                addModifier(Mod::SYNTH_FAIL_RATE_WOOD, 5);
                break;
            case MEGA_MOGLIFICATION_SMITHING:
                addModifier(Mod::SMITH, 5);
                addModifier(Mod::SYNTH_FAIL_RATE_SMITH, 5);
                break;
            case MEGA_MOGLIFICATION_GOLDSMITHING:
                addModifier(Mod::GOLDSMITH, 5);
                addModifier(Mod::SYNTH_FAIL_RATE_GOLDSMITH, 5);
                break;
            case MEGA_MOGLIFICATION_CLOTHCRAFT:
                addModifier(Mod::CLOTH, 5);
                addModifier(Mod::SYNTH_FAIL_RATE_CLOTH, 5);
                break;
            case MEGA_MOGLIFICATION_LEATHERCRAFT:
                addModifier(Mod::LEATHER, 5);
                addModifier(Mod::SYNTH_FAIL_RATE_LEATHER, 5);
                break;
            case MEGA_MOGLIFICATION_BONECRAFT:
                addModifier(Mod::BONE, 5);
                addModifier(Mod::SYNTH_FAIL_RATE_BONE, 5);
                break;
            case MEGA_MOGLIFICATION_ALCHEMY:
                addModifier(Mod::ALCHEMY, 5);
                addModifier(Mod::SYNTH_FAIL_RATE_ALCHEMY, 5);
                break;
            case MEGA_MOGLIFICATION_COOKING:
                addModifier(Mod::COOK, 5);
                addModifier(Mod::SYNTH_FAIL_RATE_COOK, 5);
                break;

            case MOGHANCEMENT_EXPERIENCE:
                addModifier(Mod::EXPERIENCE_RETAINED, 5);
                break;
            case MOGHANCEMENT_GARDENING:
                addModifier(Mod::GARDENING_WILT_BONUS, 36);
                break;
            case MOGHANCEMENT_DESYNTHESIS:
                addModifier(Mod::DESYNTH_SUCCESS, 2);
                break;
            case MOGHANCEMENT_CONQUEST:
                addModifier(Mod::CONQUEST_BONUS, 6);
                break;
            case MOGHANCEMENT_REGION:
                addModifier(Mod::CONQUEST_REGION_BONUS, 10);
                break;
            case MOGHANCEMENT_FISHING_ITEM:
                // TODO: Increases the chances of finding items when fishing
                break;
            case MOGHANCEMENT_SANDORIA_CONQUEST:
                if (profile.nation == 0)
                    addModifier(Mod::CONQUEST_BONUS, 6);
                break;
            case MOGHANCEMENT_BASTOK_CONQUEST:
                if (profile.nation == 1)
                    addModifier(Mod::CONQUEST_BONUS, 6);
                break;
            case MOGHANCEMENT_WINDURST_CONQUEST:
                if (profile.nation == 2)
                    addModifier(Mod::CONQUEST_BONUS, 6);
                break;
            case MOGHANCEMENT_MONEY:
                addModifier(Mod::GILFINDER, 10);
                break;
            case MOGHANCEMENT_CAMPAIGN:
                addModifier(Mod::CAMPAIGN_BONUS, 5);
                break;
            case MOGHANCEMENT_MONEY_II:
                addModifier(Mod::GILFINDER, 15);
                break;
            case MOGHANCEMENT_SKILL_GAINS:
                // NOTE: Exact value is unknown but considering this only granted by a newish item it makes sense SE made it fairly strong
                addModifier(Mod::COMBAT_SKILLUP_RATE, 25);
                addModifier(Mod::MAGIC_SKILLUP_RATE, 25);
                break;
            case MOGHANCEMENT_BOUNTY:
                addModifier(Mod::EXP_BONUS, 10);
                addModifier(Mod::CAPACITY_BONUS, 10);
                break;
            case MOGLIFICATION_EXPERIENCE_BOOST:
                addModifier(Mod::EXP_BONUS, 15);
                break;
            case MOGLIFICATION_CAPACITY_BOOST:
                addModifier(Mod::CAPACITY_BONUS, 15);
                break;

            // NOTE: Exact values for resistances is unknown
            case MOGLIFICATION_RESIST_POISON:
                addModifier(Mod::POISONRES, 20);
                break;
            case MOGLIFICATION_RESIST_PARALYSIS:
                addModifier(Mod::SILENCERES, 20);
                break;
            case MOGLIFICATION_RESIST_SILENCE:
                addModifier(Mod::SILENCERES, 20);
                break;
            case MOGLIFICATION_RESIST_PETRIFICATION:
                addModifier(Mod::PETRIFYRES, 20);
                break;
            case MOGLIFICATION_RESIST_VIRUS:
                addModifier(Mod::VIRUSRES, 20);
                break;
            case MOGLIFICATION_RESIST_CURSE:
                addModifier(Mod::CURSERES, 20);
                break;
            default:
                break;
        }
    }
}

void CCharEntity::TrackArrowUsageForScavenge(CItemWeapon* PAmmo)
{
    // Check if local has been set yet
    if (this->GetLocalVar("ArrowsUsed") == 0)
    {
        // Local not set yet so set
        this->SetLocalVar("ArrowsUsed", PAmmo->getID() * 10000 + 1);
    }
    else
    {
        // Local exists now check if arrow used is same as last time
        if ((floor(this->GetLocalVar("ArrowsUsed") / 10000)) == PAmmo->getID())
        {
            // Same arrow used as last time now check that arrows used do not go above 1980
            if (!(floor(this->GetLocalVar("ArrowsUsed") % 10000) >= 1980))
            {
                // Safe to increment arrows used
                this->SetLocalVar("ArrowsUsed", this->GetLocalVar("ArrowsUsed") + 1);
            }
        }
        else
        {
            // Different arrow is being used so remake local
            this->SetLocalVar("ArrowsUsed", PAmmo->getID() * 10000 + 1);
        }
    }
}

bool CCharEntity::OnAttackError(CAttackState& state)
{
    auto controller {static_cast<CPlayerController*>(PAI->GetController())};
    if (controller->getLastErrMsgTime() + std::chrono::milliseconds(this->GetWeaponDelay(false)) < PAI->getTick())
    {
        controller->setLastErrMsgTime(PAI->getTick());
        return true;
    }
    return false;
}
