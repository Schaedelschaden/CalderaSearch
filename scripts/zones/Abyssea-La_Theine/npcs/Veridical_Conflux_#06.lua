-----------------------------------
-- Zone: Abyssea-LaTheine
-- NPC: Veridical Conflux #06
-- Offers teleports between confluxes
-- !pos 
-----------------------------------
require("scripts/globals/abyssea")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
	local cruor = player:getCurrency("cruor")
    player:startEvent(2137, 6029312, 4980808, 2621496, 3670088, 255, 5, 1, cruor)
end

function onEventUpdate(player, csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 65537) then -- Veridical Conflux #01
		player:updateEvent(1, 0, 0, 38, 611, 1154, 156687, cruor)
	elseif (option == 131073 and cruor >= 92) then -- Veridical Conflux #02
		player:updateEvent(1, 0, 0, 2000, 611, -758, 44652, cruor)
		player:delCurrency("cruor", 92)
	elseif (option == 196609 and cruor >= 72) then -- Veridical Conflux #03
		player:updateEvent(1, 0, 0, 2000, 611, -758, 44652, cruor)
		player:delCurrency("cruor", 72)
	elseif (option == 262145 and cruor >= 76) then -- Veridical Conflux #04
		player:updateEvent(1, 0, 0, 2000, 611, -758, 44652, cruor)
		player:delCurrency("cruor", 76)
	elseif (option == 327681 and cruor >= 56) then -- Veridical Conflux #05
		player:updateEvent(1, 0, 0, 2000, 611, -758, 44652, cruor)
		player:delCurrency("cruor", 56)
	elseif (option == 458753 and cruor >= 72) then -- Veridical Conflux #07
		player:updateEvent(1, 0, 0, 2000, 611, -758, 44652, cruor)
		player:delCurrency("cruor", 72)
	elseif (option == 524289 and cruor >= 56) then -- Veridical Conflux #08
		player:updateEvent(1, 0, 0, 2000, 611, -758, 44652, cruor)
		player:delCurrency("cruor", 56)
	end
end

function onEventFinish(player, csid, option)

end