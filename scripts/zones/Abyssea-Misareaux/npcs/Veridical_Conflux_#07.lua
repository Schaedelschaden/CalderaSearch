-----------------------------------
-- Zone: Abyssea-Misareaux
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
    player:startEvent(2138, 2228224, 1900585, 2883630, 2097176, 511, 6, 1, cruor)
end

function onEventUpdate(player, csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 65537) then -- Veridical Conflux #01
		player:updateEvent(1, 0, 0, 2097176, 511, 6, 1, cruor)
	elseif (option == 131073 and cruor >= 34) then -- Veridical Conflux #02
		player:updateEvent(1, 0, 0, 2097176, 511, 6, 1, cruor)
		player:delCurrency("cruor", 34)
	elseif (option == 196609 and cruor >= 41) then -- Veridical Conflux #03
		player:updateEvent(1, 0, 0, 2097176, 511, 6, 1, cruor)
		player:delCurrency("cruor", 41)
	elseif (option == 262145 and cruor >= 29) then -- Veridical Conflux #04
		player:updateEvent(1, 0, 0, 2097176, 511, 6, 1, cruor)
		player:delCurrency("cruor", 29)
	elseif (option == 327681 and cruor >= 46) then -- Veridical Conflux #05
		player:updateEvent(1, 0, 0, 2097176, 511, 6, 1, cruor)
		player:delCurrency("cruor", 46)
	elseif (option == 393217 and cruor >= 44) then -- Veridical Conflux #06
		player:updateEvent(1, 0, 0, 2097176, 511, 6, 1, cruor)
		player:delCurrency("cruor", 44)
	elseif (option == 524289 and cruor >= 32) then -- Veridical Conflux #08
		player:updateEvent(1, 0, 0, 2097176, 511, 6, 1, cruor)
		player:delCurrency("cruor", 32)
	elseif (option == 589825) then -- Veridical Conflux #00
		player:updateEvent(1, 11, 21, 2097176, 511, 7, 1, cruor)
	end
end

function onEventFinish(player, csid, option)

end