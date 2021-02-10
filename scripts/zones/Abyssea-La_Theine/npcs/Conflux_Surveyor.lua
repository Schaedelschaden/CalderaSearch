-----------------------------------
-- Zone: Abyssea-LaTheine
-- NPC: Conflux Surveyor
-- !pos 
-----------------------------------
require("scripts/globals/abyssea")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
	-- Player does not have Visitant status
--    player:startEvent(2001, 0, 0, 2816, 4, 4, 0, 0, 0) -- csid, 0, 0, timeRemaining, carriedStones, totalStones, 0, 0, 0
	
	-- Player does have Visitant status
--	player:startEvent(2001, 3, 2816, 0, 4, 4, 0, 0, 0) -- csid, visitantStatus, timeRemaining, 0, carriedStones, totalStones, 0, 0, 0
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end