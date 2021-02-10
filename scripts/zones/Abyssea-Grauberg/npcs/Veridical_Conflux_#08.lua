-----------------------------------
-- Zone: Abyssea-Grauberg
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
    player:startEvent(2139, 4980736, 4980796, 3670080, 2621512, 255, 7, 1, cruor)
end

function onEventUpdate(player, csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 65537) then -- Veridical Conflux #01
		player:updateEvent(1, 0, 0, 2621512, 255, 7, 1, cruor)
	elseif (option == 131073 and cruor >= 76) then -- Veridical Conflux #02
		player:updateEvent(1, 0, 0, 2621512, 255, 7, 1, cruor)
		player:delCurrency("cruor", 76)
	elseif (option == 196609 and cruor >= 60) then -- Veridical Conflux #03
		player:updateEvent(1, 0, 0, 2621512, 255, 7, 1, cruor)
		player:delCurrency("cruor", 60)
	elseif (option == 262145 and cruor >= 76) then -- Veridical Conflux #04
		player:updateEvent(1, 0, 0, 2621512, 255, 7, 1, cruor)
		player:delCurrency("cruor", 76)
	elseif (option == 327681 and cruor >= 64) then -- Veridical Conflux #05
		player:updateEvent(1, 0, 0, 2621512, 255, 7, 1, cruor)
		player:delCurrency("cruor", 64)
	elseif (option == 393217 and cruor >= 56) then -- Veridical Conflux #06
		player:updateEvent(1, 0, 0, 2621512, 255, 7, 1, cruor)
		player:delCurrency("cruor", 56)
	elseif (option == 458753 and cruor >= 72) then -- Veridical Conflux #07
		player:updateEvent(1, 0, 0, 2621512, 255, 7, 1, cruor)
		player:delCurrency("cruor", 72)
	end
end

function onEventFinish(player, csid, option)

end