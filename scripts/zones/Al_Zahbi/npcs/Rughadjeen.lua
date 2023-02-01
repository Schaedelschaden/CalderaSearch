-----------------------------------
-- Area: Al Zahbi
--  NPC: Rughadjeen
-- Type: Skyserpent General
-- !pos 80 0 40 48
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
    -- player:startEvent(265)
    if player:getCharVar("KillCounter_BSG_General_Rughad") > 0 then
        player:addSpell(960, true, true)
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
