-----------------------------------
-- Zone: Abyssea-LaTheine
-- NPC: Veridical Conflux #03
-- Offers teleports between confluxes
-- !pos 
-----------------------------------
require("scripts/globals/abyssea")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
	local cruor = player:getCurrency("cruor")
    player:startEvent(2134, 3670016, 3145768, 4718648, 3407940, 255, 2, 1, cruor)
end

function onEventUpdate(player, csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 65537) then -- Veridical Conflux #01
		player:updateEvent(1, 0, 0, 30, 611, 474, 156687, cruor)
	elseif (option == 131073 and cruor >= 56) then -- Veridical Conflux #02
		player:updateEvent(1, 0, 0, 3407940, 255, 2, 1, cruor)
		player:delCurrency("cruor", 56)
	elseif (option == 262145 and cruor >= 48) then -- Veridical Conflux #04
		player:updateEvent(1, 0, 0, 3407940, 255, 2, 1, cruor)
		player:delCurrency("cruor", 48)
	elseif (option == 327681 and cruor >= 56) then -- Veridical Conflux #05
		player:updateEvent(1, 0, 0, 3407940, 255, 2, 1, cruor)
		player:delCurrency("cruor", 56)
	elseif (option == 393217 and cruor >= 72) then -- Veridical Conflux #06
		player:updateEvent(1, 0, 0, 3407940, 255, 2, 1, cruor)
		player:delCurrency("cruor", 72)
	elseif (option == 458753 and cruor >= 68) then -- Veridical Conflux #07
		player:updateEvent(1, 0, 0, 3407940, 255, 2, 1, cruor)
		player:delCurrency("cruor", 68)
	elseif (option == 524289 and cruor >= 52) then -- Veridical Conflux #08
		player:updateEvent(1, 0, 0, 3407940, 255, 2, 1, cruor)
		player:delCurrency("cruor", 52)
	end
end

function onEventFinish(player, csid, option)

end