-----------------------------------
-- Zone: Abyssea-LaTheine
-- NPC: Veridical Conflux #07
-- Offers teleports between confluxes
-- !pos 
-----------------------------------
require("scripts/globals/abyssea")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
	local cruor = player:getCurrency("cruor")
    player:startEvent(2138, 5505024, 3932228, 4718660, 4194344, 255, 6, 1, cruor)
end

function onEventUpdate(player, csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 65537) then -- Veridical Conflux #01
		player:updateEvent(1, 0, 0, 4194344, 255, 6, 1, cruor)
	elseif (option == 131073 and cruor >= 84) then -- Veridical Conflux #02
		player:updateEvent(1, 0, 0, 4194344, 255, 6, 1, cruor)
		player:delCurrency("cruor", 84)
	elseif (option == 196609 and cruor >= 68) then -- Veridical Conflux #03
		player:updateEvent(1, 0, 0, 4194344, 255, 6, 1, cruor)
		player:delCurrency("cruor", 68)
	elseif (option == 262145 and cruor >= 60) then -- Veridical Conflux #04
		player:updateEvent(1, 0, 0, 4194344, 255, 6, 1, cruor)
		player:delCurrency("cruor", 60)
	elseif (option == 327681 and cruor >= 68) then -- Veridical Conflux #05
		player:updateEvent(1, 0, 0, 4194344, 255, 6, 1, cruor)
		player:delCurrency("cruor", 68)
	elseif (option == 393217 and cruor >= 72) then -- Veridical Conflux #06
		player:updateEvent(1, 0, 0, 4194344, 255, 6, 1, cruor)
		player:delCurrency("cruor", 72)
	elseif (option == 524289 and cruor >= 64) then -- Veridical Conflux #08
		player:updateEvent(1, 0, 0, 4194344, 255, 6, 1, cruor)
		player:delCurrency("cruor", 64)
	end
end

function onEventFinish(player, csid, option)

end