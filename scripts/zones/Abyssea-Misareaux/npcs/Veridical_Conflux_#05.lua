-----------------------------------
-- Zone: Abyssea-Misareaux
-- NPC: Veridical Conflux #05
-- Offers teleports between confluxes
-- !pos 
-----------------------------------
require("scripts/globals/abyssea")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
	local cruor = player:getCurrency("cruor")
    player:startEvent(2136, 2555904, 2555931, 1900568, 3342382, 511, 4, 1, cruor)
end

function onEventUpdate(player, csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 65537) then -- Veridical Conflux #01
		player:updateEvent(1, 0, 0, 3342382, 511, 4, 1, cruor)
	elseif (option == 131073 and cruor >= 39) then -- Veridical Conflux #02
		player:updateEvent(1, 0, 0, 3342382, 511, 4, 1, cruor)
		player:delCurrency("cruor", 39)
	elseif (option == 196609 and cruor >= 27) then -- Veridical Conflux #03
		player:updateEvent(1, 0, 0, 3342382, 511, 4, 1, cruor)
		player:delCurrency("cruor", 27)
	elseif (option == 262145 and cruor >= 39) then -- Veridical Conflux #04
		player:updateEvent(1, 0, 0, 3342382, 511, 4, 1, cruor)
		player:delCurrency("cruor", 39)
	elseif (option == 393217 and cruor >= 29) then -- Veridical Conflux #06
		player:updateEvent(1, 0, 0, 3342382, 511, 4, 1, cruor)
		player:delCurrency("cruor", 29)
	elseif (option == 458753 and cruor >= 46) then -- Veridical Conflux #07
		player:updateEvent(1, 0, 0, 3342382, 511, 4, 1, cruor)
		player:delCurrency("cruor", 46)
	elseif (option == 524289 and cruor >= 51) then -- Veridical Conflux #08
		player:updateEvent(1, 0, 0, 3342382, 511, 4, 1, cruor)
		player:delCurrency("cruor", 51)
	elseif (option == 589825) then -- Veridical Conflux #00
		player:updateEvent(1, 11, 21, 3342382, 511, 7, 1, cruor)
	end
end

function onEventFinish(player, csid, option)

end