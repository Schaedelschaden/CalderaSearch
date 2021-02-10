-----------------------------------
-- Zone: Abyssea-Uleguerand
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
    player:startEvent(2139, 3145728, 4718640, 5242964, 2621492, 255, 7, 1, cruor)
end

function onEventUpdate(player, csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 65537) then -- Veridical Conflux #01
		player:updateEvent(1, 0, 0, 2621492, 255, 7, 1, cruor)
	elseif (option == 131073 and cruor >= 48) then -- Veridical Conflux #02
		player:updateEvent(1, 0, 0, 2621492, 255, 7, 1, cruor)
		player:delCurrency("cruor", 48)
	elseif (option == 196609 and cruor >= 48) then -- Veridical Conflux #03
		player:updateEvent(1, 0, 0, 2621492, 255, 7, 1, cruor)
		player:delCurrency("cruor", 48)
	elseif (option == 262145 and cruor >= 72) then -- Veridical Conflux #04
		player:updateEvent(1, 0, 0, 2621492, 255, 7, 1, cruor)
		player:delCurrency("cruor", 72)
	elseif (option == 327681 and cruor >= 84) then -- Veridical Conflux #05
		player:updateEvent(1, 0, 0, 2621492, 255, 7, 1, cruor)
		player:delCurrency("cruor", 84)
	elseif (option == 393217 and cruor >= 80) then -- Veridical Conflux #06
		player:updateEvent(1, 0, 0, 2621492, 255, 7, 1, cruor)
		player:delCurrency("cruor", 80)
	elseif (option == 458753 and cruor >= 52) then -- Veridical Conflux #07
		player:updateEvent(1, 0, 0, 2621492, 255, 7, 1, cruor)
		player:delCurrency("cruor", 52)
	end
end

function onEventFinish(player, csid, option)

end