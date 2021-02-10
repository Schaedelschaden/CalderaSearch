-----------------------------------
-- Area: Escha - Ru'Aun
--  NPC: Eschan Portal #1
-- !pos 9.9498 -34.0001 -463.2431 289
-----------------------------------
local ID = require("scripts/zones/Escha_RuAun/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
--	local silt = player:getCurrency("eschan_silt")
    player:startEvent(9100, 0, 319, 289, 8, 2, 100000, 50, 0) -- csid, ?, ?, ?, ?, ?, silt, silt_cost, ?
end

function onEventUpdate(player, csid, option)
	printf("Escha - Ru'Aun Eschan_Portal_#1.cpp onEventUpdate CSID: [%i]  OPTION: [%i]\n", csid, option)
	if (option == 0x00090001) then
--		player:delItem(9148, 1)
	end

	if (option == 0x00090003) then
		player:messageSpecial(ID.text.ITEM_USED, 9148)
		player:delItem(9148, 1, tpz.inv.TEMPITEMS)
	end
end

function onEventFinish(player, csid, option)

end