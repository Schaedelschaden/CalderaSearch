-----------------------------------
-- Zone: Abyssea-Vunkerl
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
    player:startEvent(2138, 2752512, 2097196, 2097182, 2490388, 511, 6, 1, cruor)
end

function onEventUpdate(player, csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 65537) then -- Veridical Conflux #01
		player:updateEvent(1, 41, 100, 2490388, 511, 6, 1, cruor)
	elseif (option == 131073 and cruor >= 42) then -- Veridical Conflux #02
		player:updateEvent(1, 41, 100, 2490388, 511, 6, 1, cruor)
		player:delCurrency("cruor", 42)
	elseif (option == 196609 and cruor >= 44) then -- Veridical Conflux #03
		player:updateEvent(1, 41, 100, 2490388, 511, 6, 1, cruor)
		player:delCurrency("cruor", 44)
	elseif (option == 262145 and cruor >= 32) then -- Veridical Conflux #04
		player:updateEvent(1, 41, 100, 2490388, 511, 6, 1, cruor)
		player:delCurrency("cruor", 32)
	elseif (option == 327681 and cruor >= 30) then -- Veridical Conflux #05
		player:updateEvent(1, 41, 100, 2490388, 511, 6, 1, cruor)
		player:delCurrency("cruor", 30)
	elseif (option == 393217 and cruor >= 32) then -- Veridical Conflux #06
		player:updateEvent(1, 41, 100, 2490388, 511, 6, 1, cruor)
		player:delCurrency("cruor", 32)
	elseif (option == 524289 and cruor >= 38) then -- Veridical Conflux #08
		player:updateEvent(1, 41, 100, 2490388, 511, 6, 1, cruor)
		player:delCurrency("cruor", 38)
	elseif (option == 589825) then -- Veridical Conflux #00
		player:updateEvent(1, 41, 100, 2490388, 255, 0, 1, cruor)
	end
end

function onEventFinish(player, csid, option)

end