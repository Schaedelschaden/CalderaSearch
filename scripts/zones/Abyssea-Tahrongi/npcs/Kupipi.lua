-----------------------------------
-- Zone: Abyssea-Tahrongi
-- NPC: Kupipi
-- !pos 
-----------------------------------
require("scripts/globals/abyssea")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
	local cruor = player:getCurrency("cruor")
    player:startEvent(300, 12360, 41, 100, 2621492, 0, 0, 0, cruor)
	
	-- If the player has triggered event 300
--	player:startEvent(301)
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end