-----------------------------------
-- Zone: Abyssea-Misareaux
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
    player:startEvent(2139, 2359296, 2359344, 3342387, 1572896, 511, 7, 1, cruor)
end

function onEventUpdate(player, csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 65537) then -- Veridical Conflux #01
		player:updateEvent(1, 0, 0, 1572896, 511, 7, 1, cruor)
	elseif (option == 131073 and cruor >= 36) then -- Veridical Conflux #02
		player:updateEvent(1, 0, 0, 1572896, 511, 7, 1, cruor)
		player:delCurrency("cruor", 36)
	elseif (option == 196609 and cruor >= 48) then -- Veridical Conflux #03
		player:updateEvent(1, 0, 0, 1572896, 511, 7, 1, cruor)
		player:delCurrency("cruor", 48)
	elseif (option == 262145 and cruor >= 36) then -- Veridical Conflux #04
		player:updateEvent(1, 0, 0, 1572896, 511, 7, 1, cruor)
		player:delCurrency("cruor", 36)
	elseif (option == 327681 and cruor >= 51) then -- Veridical Conflux #05
		player:updateEvent(1, 0, 0, 1572896, 511, 7, 1, cruor)
		player:delCurrency("cruor", 51)
	elseif (option == 393217 and cruor >= 51) then -- Veridical Conflux #06
		player:updateEvent(1, 0, 0, 1572896, 511, 7, 1, cruor)
		player:delCurrency("cruor", 51)
	elseif (option == 458753 and cruor >= 32) then -- Veridical Conflux #07
		player:updateEvent(1, 0, 0, 1572896, 511, 7, 1, cruor)
		player:delCurrency("cruor", 32)
	elseif (option == 589825) then -- Veridical Conflux #00
		player:updateEvent(1, 11, 21, 1572896, 511, 7, 1, cruor)
	end
end

function onEventFinish(player, csid, option)

end