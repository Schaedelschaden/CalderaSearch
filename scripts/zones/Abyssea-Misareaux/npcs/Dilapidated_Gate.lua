-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: Dilapidated Gate
-- !pos -400.898 -30.213 340.300 216
-----------------------------------
require("scripts/globals/abyssea")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if npc:getID() == 17662738 then
        player:startEvent(255, 216, 41, 45, 3342387, 511, 0, 1, 1265870)
    elseif npc:getID() == 17662739 then
        player:startEvent(256, 216, 41, 45, 3342387, 511, 0, 1, 1265870)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
