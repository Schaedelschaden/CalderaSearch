-----------------------------------
-- Area: Al Zahbi
--  NPC: Mihli Aliapoh
-- Type: Waterserpent General
-- !pos -40 -0.4 -115 48
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")
require("scripts/globals/besieged")
-----------------------------------

function onSpawn(npc)
    tpz.besieged.onSpawnCaldera(npc)
end

function onTrade(player, npc, trade)
    tpz.besieged.onTradeCaldera(player, npc, trade)
end

function onTrigger(player, npc)
    ---- player:startEvent(267)

    tpz.besieged.onTriggerCaldera(player, npc)
end

function onTimeTrigger(npc, triggerID)
    tpz.besieged.onTimeTriggerCaldera(npc, triggerID)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
