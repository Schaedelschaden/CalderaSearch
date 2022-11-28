-----------------------------------
-- Area: Al Zahbi
--  NPC: Zazarg
-- Type: Stoneserpent General
-- !pos -60.3 -8 40 48
-----------------------------------
require("scripts/globals/besieged")
-----------------------------------

function onTrade(player, npc, trade)
    tpz.besieged.onTradeCaldera(player, npc, trade)
end

function onTrigger(player, npc)
    -- player:startEvent(268)

    tpz.besieged.onTriggerCaldera(player, npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
