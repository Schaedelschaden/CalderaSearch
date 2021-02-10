-----------------------------------
-- Zone: Abyssea-Attohwa
-- NPC: Veridical Conflux #01
-- Offers teleports between confluxes
-- !pos 
-----------------------------------
require("scripts/globals/abyssea")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
	local cruor = player:getCurrency("cruor")
    player:startEvent(2132, 2621440, 2949160, 2752557, 2424874, 511, 0, 1, cruor)
end

function onEventUpdate(player, csid, option)
--	printf("Aby-Attohwa veridical_conflux_01.cpp onEventUpdate CSID: [%i]  OPTION: [%i]\n", csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 131073 and cruor >= 40) then -- Veridical Conflux #02
		player:updateEvent(1, 0, 0, 2424874, 511, 0, 1, cruor) -- ?, ?, ?, flux id?, fluxesUnlocked, ?, ?, cruor
		player:delCurrency("cruor", 40)
	elseif (option == 196609 and cruor >= 40) then -- Veridical Conflux #03
		player:updateEvent(1, 0, 0, 2424874, 511, 0, 1, cruor)
		player:delCurrency("cruor", 40)
	elseif (option == 262145 and cruor >= 45) then -- Veridical Conflux #04
		player:updateEvent(1, 0, 0, 2424874, 511, 0, 1, cruor)
		player:delCurrency("cruor", 45)
	elseif (option == 327681 and cruor >= 45) then -- Veridical Conflux #05
		player:updateEvent(1, 0, 0, 2424874, 511, 0, 1, cruor)
		player:delCurrency("cruor", 45)
	elseif (option == 393217 and cruor >= 42) then -- Veridical Conflux #06
		player:updateEvent(1, 0, 0, 2424874, 511, 0, 1, cruor)
		player:delCurrency("cruor", 42)
	elseif (option == 458753 and cruor >= 42) then -- Veridical Conflux #07
		player:updateEvent(1, 0, 0, 2424874, 511, 0, 1, cruor)
		player:delCurrency("cruor", 42)
	elseif (option == 524289 and cruor >= 37) then -- Veridical Conflux #08
		player:updateEvent(1, 0, 0, 2424874, 511, 0, 1, cruor)
		player:delCurrency("cruor", 37)
	elseif (option == 589825) then -- Veridical Conflux #00
		player:updateEvent(1, 0, 0, 2424874, 255, 0, 1, cruor)
	end
end

function onEventFinish(player, csid, option)

end