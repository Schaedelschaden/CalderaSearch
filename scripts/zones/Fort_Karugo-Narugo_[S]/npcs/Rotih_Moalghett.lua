----------------------------------
-- Area: Fort Karugo Narugo [S]
--  NPC: Rotih_Moalghett
-- Type: Quest
-- !pos 280 -20 85 96
-----------------------------------
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if (player:getQuestStatus(CRYSTAL_WAR, tpz.quest.id.crystalWar.THE_TIGRESS_STRIKES) == QUEST_ACCEPTED) then
        if (player:getCharVar("TigressStrikesProg") == 1) then
            player:startEvent(101)
        else
            player:startEvent(104)
        end
    end
	
	if (player:getQuestStatus(CRYSTAL_WAR, tpz.quest.id.crystalWar.KNOT_QUITE_THERE) == QUEST_COMPLETED and
		player:getQuestStatus(CRYSTAL_WAR, tpz.quest.id.crystalWar.A_MANIFEST_PROBLEM) == QUEST_AVAILABLE) then
		player:startEvent(105)
	end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if (csid == 104) then
        player:setCharVar("TigressStrikesProg", 1)
	elseif (csid == 105) then
		player:addQuest(CRYSTAL_WAR, tpz.quest.id.crystalWar.A_MANIFEST_PROBLEM)
    end
end
