-----------------------------------
-- Zone: Abyssea-Altepa
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
    player:startEvent(2132, 3670016, 4980796, 5505116, 6553680, 255, 0, 1, cruor)
end

function onEventUpdate(player, csid, option)
--	printf("Aby-Altepa veridical_conflux_01.cpp onEventUpdate CSID: [%i]  OPTION: [%i]\n", csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 131073 and cruor >= 56) then -- Veridical Conflux #02
		player:updateEvent(1, 41, 100, 6553680, 255, 1, 1, cruor) -- ?, ?, ?, flux id?, fluxesUnlocked, ?, ?, cruor
		player:delCurrency("cruor", 56)
	elseif (option == 196609 and cruor >= 60) then -- Veridical Conflux #03
		player:updateEvent(1, 41, 100, 6553680, 255, 1, 1, cruor)
		player:delCurrency("cruor", 60)
	elseif (option == 262145 and cruor >= 76) then -- Veridical Conflux #04
		player:updateEvent(1, 41, 100, 6553680, 255, 1, 1, cruor)
		player:delCurrency("cruor", 76)
	elseif (option == 327681 and cruor >= 92) then -- Veridical Conflux #05
		player:updateEvent(1, 41, 100, 6553680, 255, 1, 1, cruor)
		player:delCurrency("cruor", 92)
	elseif (option == 393217 and cruor >= 84) then -- Veridical Conflux #06
		player:updateEvent(1, 41, 100, 6553680, 255, 1, 1, cruor)
		player:delCurrency("cruor", 84)
	elseif (option == 458753 and cruor >= 80) then -- Veridical Conflux #07
		player:updateEvent(1, 41, 100, 6553680, 255, 1, 1, cruor)
		player:delCurrency("cruor", 80)
	elseif (option == 524289 and cruor >= 100) then -- Veridical Conflux #08
		player:updateEvent(1, 41, 100, 6553680, 255, 1, 1, cruor)
		player:delCurrency("cruor", 100)
	end
end

function onEventFinish(player, csid, option)

end