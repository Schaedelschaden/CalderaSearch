-----------------------------------
-- Area: Al Zahbi
--  NPC: Najelith
-- Type: Galeserpent General
-- !pos 40 -0.4 115 48
-----------------------------------
require("scripts/globals/besieged")
-----------------------------------

function onTrade(player, npc, trade)
    tpz.besieged.onTradeCaldera(player, npc, trade)
end

function onTrigger(player, npc)
    -- player:startEvent(269)

    tpz.besieged.onTriggerCaldera(player, npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
