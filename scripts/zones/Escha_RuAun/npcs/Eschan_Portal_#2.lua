-----------------------------------
-- Area: Escha - Ru'Aun
--  NPC: Eschan Portal #2
-- !pos -274.7603 -40.5040 -377.8283 289
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
--    player:startEvent(9100, 0, 831, 289, 9, 1, 100000, 50, 0) -- csid, ?, ?, ?, ?, ?, silt, ?, ?
	player:startEvent(9100, 0, 831, 289, 9, 0, 100000, 50, 0) -- csid, ?, ?, ?, ?, ?, silt, ?, ?
end

function onEventUpdate(player, csid, option)
	printf("Escha - Ru'Aun Eschan_Portal_#2.cpp onEventUpdate CSID: [%i]  OPTION: [%i]\n", csid, option)
	if (option == 0x00090001) then
--		player:delItem(9148, 1)
	end

	if (option == 0x00090003) then
		player:messageSpecial(ID.text.ITEM_USED, 9148)
--		player:delItem(9148, 1)
--		player:PrintToPlayer(string.format("You have used a clump of eschan droplets."), tpz.msg.channel.NS_SAY) -- Needs to be replaced with correct ID.text when found
	end
end

function onEventFinish(player, csid, option)

end