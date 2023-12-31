-----------------------------------
-- Area: Buburimu Peninsula
--  NPC: Cavernous Maw
-- !pos -334 -24 52 118
-- Teleports Players to Abyssea - Attohwa
-----------------------------------
local ID = require("scripts/zones/Buburimu_Peninsula/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/globals/abyssea")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if
        ENABLE_ABYSSEA == 1 and
        player:getMainLvl() >= 90 and
        player:getCharVar("KillCounter_Briareus") >= 1 and
        player:getCharVar("KillCounter_Kukulkan") >= 1 and
        player:getCharVar("KillCounter_Glavoid") >= 1
    then
        if
            -- tpz.abyssea.getTravStonesTotal(player) >= 1 and
            player:getQuestStatus(ABYSSEA, tpz.quest.id.abyssea.DAWN_OF_DEATH) == QUEST_ACCEPTED and
            player:getQuestStatus(ABYSSEA, tpz.quest.id.abyssea.A_FLUTTERY_FIEND) == QUEST_AVAILABLE
        then
            player:startEvent(62)
        else
            player:startEvent(61, 0, 1) -- No param = no entry.
        end
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if (csid == 62) then
        player:addQuest(ABYSSEA, tpz.quest.id.abyssea.A_FLUTTERY_FIEND)
    elseif (csid == 63) then
        -- Killed Itzpapalotl
    elseif (csid == 61 and option == 1) then
        player:setPos(-140, 20, -181, 131, 215)
    end
end
