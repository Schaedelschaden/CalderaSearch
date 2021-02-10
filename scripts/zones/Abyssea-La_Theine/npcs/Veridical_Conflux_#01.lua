-----------------------------------
-- Zone: Abyssea-LaTheine
-- NPC: Veridical Conflux #01
-- Offers teleports between confluxes
-- !pos -479 0 772
-----------------------------------
require("scripts/globals/abyssea")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
	local cruor = player:getCurrency("cruor")
    player:startEvent(2132, 4456448, 4456520, 6815836, 5505104, 255, 0, 1, cruor)
end

function onEventUpdate(player, csid, option)
--	printf("Aby-LaTheine veridical_conflux_01.cpp onEventUpdate CSID: [%i]  OPTION: [%i]\n", csid, option)
	local cruor = player:getCurrency("cruor")
	if (option == 131073 and cruor >= 68) then -- Veridical Conflux #02
		player:updateEvent(1, 0, 0, 32, 355, 601, 532908, cruor)
		player:delCurrency("cruor", 68)
	elseif (option == 196609 and cruor >= 72) then -- Veridical Conflux #03
		player:updateEvent(1, 0, 0, 5505104, 255, 0, 1, cruor)
		player:delCurrency("cruor", 72)
	elseif (option == 262145 and cruor >= 68) then -- Veridical Conflux #04
		player:updateEvent(1, 0, 0, 30, 611, -445, 156687, cruor)
		player:delCurrency("cruor", 68)
	elseif (option == 327681 and cruor >= 92) then -- Veridical Conflux #05
		player:updateEvent(1, 0, 0, 30, 611, 1985, 156687, cruor)
		player:delCurrency("cruor", 92)
	elseif (option == 393217 and cruor >= 104) then -- Veridical Conflux #06
		player:updateEvent(1, 0, 0, 5505104, 255, 0, 1, cruor)
		player:delCurrency("cruor", 104)
	elseif (option == 458753 and cruor >= 80) then -- Veridical Conflux #07
		player:updateEvent(1, 0, 0, 38, 611, 1493, 156687, cruor)
		player:delCurrency("cruor", 80)
	elseif (option == 524289 and cruor >= 84) then -- Veridical Conflux #08
		player:updateEvent(1, 0, 0, 5505104, 255, 0, 1, cruor)
		player:delCurrency("cruor", 84)
	end
end

function onEventFinish(player, csid, option)

end