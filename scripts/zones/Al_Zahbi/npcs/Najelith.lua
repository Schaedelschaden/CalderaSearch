-----------------------------------
-- Area: Al Zahbi
--  NPC: Najelith
-- Type: Galeserpent General
-- !pos 40 -0.4 115 48
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
    -- player:startEvent(269)
    if player:getCharVar("KillCounter_BSG_Gurfurlur_the_") > 0 then
        player:addSpell(929, true, true)
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
