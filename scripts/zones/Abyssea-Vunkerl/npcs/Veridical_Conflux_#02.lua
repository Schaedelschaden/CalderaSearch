-----------------------------------
-- Zone: Abyssea-Vunkerl
-- NPC: Veridical Conflux #02
-- Offers teleports between confluxes
-- !pos 
-----------------------------------
require("scripts/globals/abyssea")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
	local cruor = player:getCurrency("cruor")
    player:startEvent(2133, 1310720, 1966104, 2752548, 1572906, 511, 1, 1, cruor)
end

function onEventUpdate(player, csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 65537) then -- Veridical Conflux #01
		player:updateEvent(1, 41, 100, 1572906, 511, 1, 1, cruor)
	elseif (option == 196609 and cruor >= 24) then -- Veridical Conflux #03
		player:updateEvent(1, 41, 100, 1572906, 511, 1, 1, cruor)
		player:delCurrency("cruor", 24)
	elseif (option == 262145 and cruor >= 30) then -- Veridical Conflux #04
		player:updateEvent(1, 41, 100, 1572906, 511, 1, 1, cruor)
		player:delCurrency("cruor", 30)
	elseif (option == 327681 and cruor >= 36) then -- Veridical Conflux #05
		player:updateEvent(1, 41, 100, 1572906, 511, 1, 1, cruor)
		player:delCurrency("cruor", 36)
	elseif (option == 393217 and cruor >= 42) then -- Veridical Conflux #06
		player:updateEvent(1, 41, 100, 1572906, 511, 1, 1, cruor)
		player:delCurrency("cruor", 42)
	elseif (option == 458753 and cruor >= 42) then -- Veridical Conflux #07
		player:updateEvent(1, 41, 100, 1572906, 511, 1, 1, cruor)
		player:delCurrency("cruor", 42)
	elseif (option == 524289 and cruor >= 24) then -- Veridical Conflux #08
		player:updateEvent(1, 41, 100, 1572906, 511, 1, 1, cruor)
		player:delCurrency("cruor", 24)
	elseif (option == 589825) then -- Veridical Conflux #00
		player:updateEvent(1, 41, 100, 1572906, 255, 0, 1, cruor)
	end
end

function onEventFinish(player, csid, option)

end