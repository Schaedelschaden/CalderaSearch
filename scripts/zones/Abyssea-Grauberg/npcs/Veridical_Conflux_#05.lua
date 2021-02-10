-----------------------------------
-- Zone: Abyssea-Grauberg
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
	-- Ivory Abyssite of Confluence
    player:startEvent(2136, 5242880, 4718664, 3145768, 4194356, 255, 4, 1, cruor)
	-- Indigo Abyssite of Confluence
--	player:startEvent(2136, 3932160, 3538998, 2359326, 3145767, 255, 4, 1, cruor)
end

function onEventUpdate(player, csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 65537) then -- Veridical Conflux #01
		-- Ivory Abyssite of Confluence
		player:updateEvent(1, 0, 0, 4194356, 255, 4, 1, cruor)
		-- Indigo Abyssite of Confluence
--		player:updateEvent(1, 0, 0, 3145767, 255, 4, 1, cruor)
	elseif (option == 131073 and cruor >= 80) then -- Veridical Conflux #02
		player:updateEvent(1, 0, 0, 4194356, 255, 4, 1, cruor)
		player:delCurrency("cruor", 80)
	elseif (option == 196609 and cruor >= 72) then -- Veridical Conflux #03
		player:updateEvent(1, 0, 0, 4194356, 255, 4, 1, cruor)
		player:delCurrency("cruor", 72)
	elseif (option == 262145 and cruor >= 72) then -- Veridical Conflux #04
		player:updateEvent(1, 0, 0, 4194356, 255, 4, 1, cruor)
		player:delCurrency("cruor", 72)
	elseif (option == 393217 and cruor >= 48) then -- Veridical Conflux #06
		player:updateEvent(1, 0, 0, 4194356, 255, 4, 1, cruor)
		player:delCurrency("cruor", 48)
	elseif (option == 458753 and cruor >= 52) then -- Veridical Conflux #07
		player:updateEvent(1, 0, 0, 4194356, 255, 4, 1, cruor)
		player:delCurrency("cruor", 52)
	elseif (option == 524289 and cruor >= 64) then -- Veridical Conflux #08
		player:updateEvent(1, 0, 0, 4194356, 255, 4, 1, cruor)
		player:delCurrency("cruor", 64)
	end
end

function onEventFinish(player, csid, option)

end