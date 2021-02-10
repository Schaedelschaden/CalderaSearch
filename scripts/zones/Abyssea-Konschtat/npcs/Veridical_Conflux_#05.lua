-----------------------------------
-- Zone: Abyssea-Konschtat
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
    player:startEvent(2136, 3932160, 3145788, 3407912, 3932224, 255, 4, 1, cruor)
end

function onEventUpdate(player, csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 65537) then -- Veridical Conflux #01
		player:updateEvent(1, 0, 0, 3932224, 255, 4, 1, cruor)
	elseif (option == 131073 and cruor >= 60) then -- Veridical Conflux #02
		player:updateEvent(1, 0, 0, 3932224, 255, 4, 1, cruor)
		player:delCurrency("cruor", 60)
	elseif (option == 196609 and cruor >= 60) then -- Veridical Conflux #03
		player:updateEvent(1, 0, 0, 3932224, 255, 4, 1, cruor)
		player:delCurrency("cruor", 60)
	elseif (option == 262145 and cruor >= 48) then -- Veridical Conflux #04
		player:updateEvent(1, 0, 0, 3932224, 255, 4, 1, cruor)
		player:delCurrency("cruor", 48)
	elseif (option == 393217 and cruor >= 52) then -- Veridical Conflux #06
		player:updateEvent(1, 0, 0, 3932224, 255, 4, 1, cruor)
		player:delCurrency("cruor", 52)
	elseif (option == 458753 and cruor >= 64) then -- Veridical Conflux #07
		player:updateEvent(1, 0, 0, 3932224, 255, 4, 1, cruor)
		player:delCurrency("cruor", 64)
	elseif (option == 524289 and cruor >= 60) then -- Veridical Conflux #08
		player:updateEvent(1, 0, 0, 3932224, 255, 4, 1, cruor)
		player:delCurrency("cruor", 60)
	end
end

function onEventFinish(player, csid, option)

end