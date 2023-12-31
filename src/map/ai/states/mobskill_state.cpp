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

#include "mobskill_state.h"
#include "../ai_container.h"
#include "../../entities/mobentity.h"
#include "../../packets/action.h"
#include "../../utils/battleutils.h"
#include "../../mobskill.h"
#include "../../status_effect_container.h"
#include "../../enmity_container.h"

CMobSkillState::CMobSkillState(CMobEntity* PEntity, uint16 targid, uint16 wsid) :
    CState(PEntity, targid),
    m_PEntity(PEntity)
{
//	printf("mobskill_state.cpp MOBSKILL STATE TRIGGERED targid: [%i]  wsid: [%i]\n", targid, wsid);
    auto skill = battleutils::GetMobSkill(wsid);
    if (!skill)
    {
//		printf("mobskill_state.cpp SKILL EXCEPTION\n");
        throw CStateInitException(nullptr);
    }

    if (m_PEntity->StatusEffectContainer->HasStatusEffect({EFFECT_AMNESIA, EFFECT_IMPAIRMENT}))
    {
//		printf("mobskill_state.cpp AMNESIA/IMPAIRMENT EXCEPTION\n");
        throw CStateInitException(nullptr);
    }
	
	// 12/01/20 Schae
	// BST jug pet offensive abilities hit this line and return a target exception. They will not target the monster they are currently fighting.
	// Worked around this by creating pet scripts for all of the offensive abilities
//	printf("mobskill_state.cpp TARGET NAME: [%s]  TARGET ID: [%i]\n", m_PEntity->GetName(), m_targid);
    auto PTarget = m_PEntity->IsValidTarget(m_targid, skill->getValidTargets(), m_errorMsg);
/* 	if (PTarget == nullptr)
	{
		PTarget = m_PEntity->GetBattleTarget();
		printf("mobskill_state.cpp MASTER NAME: [%s]  MASTER TARGET: [%i]  PET TARGET: [%i]\n", m_PEntity->PMaster->GetName(), m_PEntity->PMaster->GetBattleTarget()->id, m_PEntity->GetBattleTarget()->id);
	} */

    if (!PTarget || m_errorMsg)
    {
//		printf("mobskill_state.cpp TARGET EXCEPTION\n");
        throw CStateInitException(std::move(m_errorMsg));
    }

    m_PSkill = std::make_unique<CMobSkill>(*skill);

    m_castTime = std::chrono::milliseconds(m_PSkill->getActivationTime());

    if (m_castTime > 0s)
    {
        action_t action;
        action.id = m_PEntity->id;
        action.actiontype = ACTION_MOBABILITY_START;

        actionList_t& actionList = action.getNewActionList();
        actionList.ActionTargetID = PTarget->id;

        actionTarget_t& actionTarget = actionList.getNewActionTarget();

        actionTarget.reaction = REACTION_NONE;
        actionTarget.speceffect = SPECEFFECT_NONE;
        actionTarget.animation = 0;
        actionTarget.param = m_PSkill->getID();
        actionTarget.messageID = 43;
        m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE, new CActionPacket(action));
    }
//	printf("mobskill_state.cpp MOBSKILL STATE TRIGGER WEAPONSKILL_STATE_ENTER\n");
    m_PEntity->PAI->EventHandler.triggerListener("WEAPONSKILL_STATE_ENTER", m_PEntity, m_PSkill->getID());
    SpendCost();
}

CMobSkill* CMobSkillState::GetSkill()
{
    return m_PSkill.get();
}

void CMobSkillState::SpendCost()
{
    if (m_PSkill->isTpSkill())
    {
        if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_SEKKANOKI))
        {
            m_spentTP = m_PEntity->addTP(-1000);
            m_PEntity->StatusEffectContainer->DelStatusEffect(EFFECT_SEKKANOKI);
        }
        else
        {
            m_spentTP = m_PEntity->health.tp;
            m_PEntity->health.tp = 0;
        }
    }
}

bool CMobSkillState::Update(time_point tick)
{
	// printf("mobskill_state.cpp Update START\n");
    if (tick > GetEntryTime() + m_castTime && !IsCompleted())
    {
        action_t action;
        m_PEntity->OnMobSkillFinished(*this, action);
//		printf("mobskill_state.cpp Update onMobSkillFinished REACHED\n");
        m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));
        auto delay = std::chrono::milliseconds(m_PSkill->getAnimationTime());
        m_finishTime = tick + delay;
        Complete();
    }
    if (IsCompleted() && tick > m_finishTime)
    {
        auto PTarget = GetTarget();
        if (PTarget && PTarget->objtype == TYPE_MOB && PTarget != m_PEntity && m_PEntity->allegiance == ALLEGIANCE_PLAYER)
        {
            static_cast<CMobEntity*>(PTarget)->PEnmityContainer->UpdateEnmity(m_PEntity, 0, 0);
        }
        m_PEntity->PAI->EventHandler.triggerListener("WEAPONSKILL_STATE_EXIT", m_PEntity, m_PSkill->getID());
//		printf("mobskill_state.cpp Update WEAPONSKILL_STATE_EXIT REACHED\n\n");
        return true;
    }
//	printf("mobskill_state.cpp Update RETURNING FALSE\n");
    return false;
}

void CMobSkillState::Cleanup(time_point tick)
{
    if (!IsCompleted())
    {
        action_t action;
        action.id = m_PEntity->id;
        action.actiontype = ACTION_MOBABILITY_INTERRUPT;

        actionList_t& actionList = action.getNewActionList();
        actionList.ActionTargetID = m_PEntity->id;

        actionTarget_t& actionTarget = actionList.getNewActionTarget();
        actionTarget.animation = m_PSkill->getID();

        m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE, new CActionPacket(action));
    }
}