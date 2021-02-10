-----------------------------------
-- Zone: Abyssea-LaTheine
-- NPC: Regine
-- Gives the quest "Catering Capers"
-- !pos 
-----------------------------------
require("scripts/globals/abyssea")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
	local cruor = player:getCurrency("cruor")
    player:startEvent(168, 132, 0, 0, 200, 611, 982, 44652, 0)
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end