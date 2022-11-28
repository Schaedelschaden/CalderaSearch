-----------------------------------
-- Area: Al Zahbi
--  NPC: Gadalar
-- Type: Fireserpent General
-- !pos 39 0 -38 48
-----------------------------------
require("scripts/globals/besieged")
-----------------------------------

function onTrade(player, npc, trade)
    tpz.besieged.onTradeCaldera(player, npc, trade)
end

function onTrigger(player, npc)
    -- player:startEvent(266)

    tpz.besieged.onTriggerCaldera(player, npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
