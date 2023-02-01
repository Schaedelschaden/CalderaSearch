-----------------------------------
-- Area: Al Zahbi
--  NPC: Gadalar
-- Type: Fireserpent General
-- !pos 39 0 -38 48
-----------------------------------
require("scripts/globals/besieged")
-----------------------------------

function onSpawn(npc)
    tpz.besieged.onSpawnCaldera(npc)
end

function onTrade(player, npc, trade)
    tpz.besieged.onTradeCaldera(player, npc, trade)
end

function onTrigger(player, npc)
    -- player:startEvent(266)
    if player:getCharVar("KillCounter_BSG_Gulool_Ja_Ja") > 0 then
        player:addSpell(919, true, true)
    end

    tpz.besieged.onTriggerCaldera(player, npc)
end

function onTimeTrigger(npc, triggerID)
    tpz.besieged.onTimeTriggerCaldera(npc, triggerID)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
