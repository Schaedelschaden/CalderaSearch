-----------------------------------
-- Zone: Abyssea-Attohwa
-- NPC: Veridical Conflux #00
-- Offers teleports between confluxes
-- !pos 
-----------------------------------
require("scripts/globals/abyssea")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
	local cruor = player:getCurrency("cruor")
    player:startEvent(123, 2228224, 2424874, 2228272, 2424877, 255, 8, 1, cruor)
end

function onEventUpdate(player, csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 65537) then -- Veridical Conflux #01
		player:updateEvent(1, 0, 0, 2424877, 255, 8, 1, cruor)
	elseif (option == 131073 and cruor >= 34) then -- Veridical Conflux #02
		player:updateEvent(1, 0, 0, 2424877, 255, 8, 1, cruor)
		player:delCurrency("cruor", 34)
	elseif (option == 196609 and cruor >= 42) then -- Veridical Conflux #03
		player:updateEvent(1, 0, 0, 2424877, 255, 8, 1, cruor)
		player:delCurrency("cruor", 42)
	elseif (option == 262145 and cruor >= 37) then -- Veridical Conflux #04
		player:updateEvent(1, 0, 0, 2424877, 255, 8, 1, cruor)
		player:delCurrency("cruor", 37)
	elseif (option == 327681 and cruor >= 48) then -- Veridical Conflux #05
		player:updateEvent(1, 0, 0, 2424877, 255, 8, 1, cruor)
		player:delCurrency("cruor", 48)
	elseif (option == 393217 and cruor >= 34) then -- Veridical Conflux #06
		player:updateEvent(1, 0, 0, 2424877, 255, 8, 1, cruor)
		player:delCurrency("cruor", 34)
	elseif (option == 458753 and cruor >= 45) then -- Veridical Conflux #07
		player:updateEvent(1, 0, 0, 2424877, 255, 8, 1, cruor)
		player:delCurrency("cruor", 45)
	elseif (option == 524289 and cruor >= 37) then -- Veridical Conflux #08
		player:updateEvent(1, 0, 0, 2424877, 255, 8, 1, cruor)
		player:delCurrency("cruor", 37)
	end
end

function onEventFinish(player, csid, option)

end