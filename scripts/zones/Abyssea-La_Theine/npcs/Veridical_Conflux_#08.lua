-----------------------------------
-- Zone: Abyssea-LaTheine
-- NPC: Veridical Conflux #08
-- Offers teleports between confluxes
-- !pos 
-----------------------------------
require("scripts/globals/abyssea")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
	local cruor = player:getCurrency("cruor")
    player:startEvent(2139, 4718592, 3670068, 3670064, 2621504, 255, 7, 1, cruor)
end

function onEventUpdate(player, csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 65537) then -- Veridical Conflux #01
		player:updateEvent(1, 0, 0, 200, 611, -1842, 44652, cruor)
	elseif (option == 131073 and cruor >= 72) then -- Veridical Conflux #02
		player:updateEvent(1, 0, 0, 2621504, 255, 7, 1, cruor)
		player:delCurrency("cruor", 72)
	elseif (option == 196609 and cruor >= 52) then -- Veridical Conflux #03
		player:updateEvent(1, 0, 0, 2621504, 255, 7, 1, cruor)
		player:delCurrency("cruor", 52)
	elseif (option == 262145 and cruor >= 56) then -- Veridical Conflux #04
		player:updateEvent(1, 0, 0, 2621504, 255, 7, 1, cruor)
		player:delCurrency("cruor", 56)
	elseif (option == 327681 and cruor >= 48) then -- Veridical Conflux #05
		player:updateEvent(1, 0, 0, 2621504, 255, 7, 1, cruor)
		player:delCurrency("cruor", 48)
	elseif (option == 393217 and cruor >= 56) then -- Veridical Conflux #06
		player:updateEvent(1, 0, 0, 2621504, 255, 7, 1, cruor)
		player:delCurrency("cruor", 56)
	elseif (option == 458753 and cruor >= 64) then -- Veridical Conflux #07
		player:updateEvent(1, 0, 0, 2621504, 255, 7, 1, cruor)
		player:delCurrency("cruor", 64)
	end
end

function onEventFinish(player, csid, option)

end