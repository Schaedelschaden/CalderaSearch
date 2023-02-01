-----------------------------------
-- Area: Al Zahbi
--  NPC: Zazarg
-- Type: Stoneserpent General
-- !pos -60.3 -8 40 48
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
    -- player:startEvent(268)
    if player:getCharVar("KillCounter_BSG_Illuyankas") > 0 then
        player:addSpell(924, true, true)
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
