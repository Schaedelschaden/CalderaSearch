-----------------------------------
-- Area: Escha Zi'Tah (288)
--  NPC: Affi
-- Type: Key Item NPC
-- Trades various items for Grisly Trinkets
-- !pos -356.838 0.128 -170.063
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
local ID = require("scripts/zones/Escha_ZiTah/IDs")

local trades =
{
	{654, 654}, -- Darksteel Ingot x2
	{717, 717, 717}, -- Mahogany Lumber x3
	{829, 829}, -- Silk Cloth x2
	{1629, 1629}, -- Buffalo Leather x2
	{745, 745}, -- Gold Ingot x2
	{13091}, -- Carapace Gorget x1
	{16564}, -- Flame Blade x1
	{16581}, -- Holy Sword x1
	{4398, 4398, 4398, 4398, 4398, 4398}, -- Fish Mithkabob x6
	{9060, 9060, 9060, 9060, 9060}, -- Ethereal Incense x5
	{9057, 9057, 9057, 9057, 9057}, -- Ayapec's Shell x5
	{4061, 4061, 4061, 4061, 4061}, -- Riftborn Boulder x5
	{4060, 4060, 4060, 4060, 4060}, -- Beitetsu x5
	{4059, 4059, 4059, 4059, 4059}, -- Pluton x5
	{9078, 9076}, -- Ashweed x1, Gravewood Log x1
	{9077, 9076}, -- Duskcrawler x1, Gravewood Log x1
	{9078, 9077}, -- Ashweed x1, Duskcrawler x1
	{9078, 9077, 9076} -- Ashweed x1, Duskcrawler x1, Gravewood Log x1
}

-- 9702 (0x000025E6) has T1 trades
-- 9703 (0x000025E7) has T2 Ayapec's Shell trades
-- 9704 (0x000025E8) has T2 Ethereal Incense trades

function onTrade(player, npc, trade)
	for i = 1, #trades do
		if (npcUtil.tradeHasExactly(trade, trades[i]) and i <= 9) then
			player:startEvent(9702)
			break
		elseif (npcUtil.tradeHasExactly(trade, trades[i]) and i == 10) then
			player:startEvent(9704)
			break
		elseif (npcUtil.tradeHasExactly(trade, trades[i]) and i == 11) then
			player:startEvent(9703)
			break
		elseif (npcUtil.tradeHasExactly(trade, trades[i]) and i >= 12 and i <= 14) then
--			printf("Affi onTrade T3 ACCEPTABLE TRADE FOUND")
			break
		elseif (npcUtil.tradeHasExactly(trade, trades[i]) and i >= 15 and i <= 17) then
--			printf("Affi onTrade T1 HELM ACCEPTABLE TRADE FOUND")
			break
		elseif (npcUtil.tradeHasExactly(trade, trades[i]) and i == 18) then
--			printf("Affi onTrade T2 HELM ACCEPTABLE TRADE FOUND")
			break
		end
	end
end

function onTrigger(player, npc)
	local silt = player:getCurrency("escha_silt")
	local tollPaid = player:getCharVar("AffiTollPaid")

	-- Event to require 10 Eschan Silt as payment
--	if (tollPaid < 1) then
--		player:startEvent(9701, 0x001FFC10, silt, 0x010001C0, 0, 0, 0, 0, 0) -- csid, ?, silt, ?, 0, 0, 0, 0, 0
--	elseif () then -- Eschan Silt has been paid/T1 Geas Fete not unlocked
--		player:startEvent(9701, 0x001FFC12, silt, 0x070001C4, 0, 0, 0, 0, 0) -- csid, ?, silt, ?, 0, 0, 0, 0, 0		
--		player:startEvent(9701, 0x001FFC18, 100000, 0x070001C4, 0, 0, 0, 0, 0)
--	end
	-- player:startEvent(9701, 0x001FFC60, silt, 0x070001C4, 0, 0, 0, 0, 0)
	if (player:hasKeyItem(2894)) then -- Has Tribulens
		player:startEvent(9701, 0x001FFC60, silt, 0x070001C5, 0, 0, 0, 0, 0)
	else -- Eschan Silt paid/T1 Geas Fete unlocked
		player:startEvent(9701, 0x001FFC18, silt, 0x070001C4, 0, 0, 0, 0, 0) -- csid, ?, silt, ?, 0, 0, 0, 0, 0
	end
end

function onEventUpdate(player, csid, option)
	-- printf("Affi.lua onEventUpdate CSID: [%i]  Option: [%i]", csid, option)
	local silt = player:getCurrency("escha_silt")
	local param3 = 0x070001C4
	
	if (player:hasKeyItem(2894)) then
		param3 = 0x070001C5
	end
	
	-- Normal "chat" menu
	if (csid == 9701) then
		-- Option 3 = Receive Key Items
			-- Option 9 = Never mind
			-- Option 4 = Tribulens
				-- player:updateEvent(0x001FFC60, silt, 0x070001C5, 0, 0, 0, 0, 0)
			-- Option 260 = Reaper
			-- Option 772 = Map of Escha - Ru'Aun
			-- Option 1028 = Map of Reisenjima
			-- Option 1284 = Eschan Urn
			-- Option 2308 = Radialens
			-- Option 2564 = Mollifier
	
		if (option == 2) then
			player:delCurrency("escha_silt", 10)
			player:setCharVar("AffiTollPaid", 1)
		elseif (option == 4) then -- Tribulens
			if not (player:hasKeyItem(2894)) then
				param3 = 0x070001C5
				player:delCurrency("escha_silt", 1000)
				player:addKeyItem(2894)
				silt = player:getCurrency("escha_silt")
				player:updateEvent(0x001FFC60, silt, param3, 0, 0, 0, 0, 0)
			end
		elseif (option == 8) then
			player:updateEvent(119, 2052, 0, 507920, 0, 0, 0, 4095)
		elseif (option == 9) then
			player:updateEvent(0x001FFC18, silt, 0, param3, 0, 0, 0, 0)
			-- player:updateEvent(0x001FFC18, 100000, 0, 0x070001C4, 0, 0, 0, 0)
		elseif (option == 14) then
			player:updateEvent(-1024, 32767, 0, 0, 0, 0, 0, 0)
		end
	end
end

function onEventFinish(player, csid, option)
--	printf("Affi.lua onEventFinish CSID: [%i]  Option: [%i]", csid, option)
	
	local keyItem = 0
	
	-- T1 Trade menu
	if (csid == 9702) then
		if (option == 0x00000100) then
			keyItem = 2895 -- Wepwawet's Tooth
		elseif (option == 0x00000200) then
			keyItem = 2896 -- Lydia's Vine
		elseif (option == 0x00000300) then
			keyItem = 2897 -- Aglaophotis Bud
		elseif (option == 0x00000400) then
			keyItem = 2898 -- Tangata's Wing
		elseif (option == 0x00000500) then
			keyItem = 2899 -- Vidala's Claw
		elseif (option == 0x00000600) then
			keyItem = 2900 -- Gestalt's Retina
		elseif (option == 0x00000700) then
			keyItem = 2901 -- Angrboda's Necklace
		elseif (option == 0x00000800) then
			keyItem = 2902 -- Cunnast's Talon
		elseif (option == 0x00000900) then
			keyItem = 2903 -- Revetaur's Horn
		elseif (option == 0x00000A00) then
			keyItem = 2904 -- Ferrodon's Scale
		elseif (option == 0x00000B00) then
			keyItem = 2905 -- Gulltop's Shell
		elseif (option == 0x00000C00) then
			keyItem = 2906 -- Vyala's Prey
		end
	-- T2 Trade menu (Ayapec's Shell)
	elseif (csid == 9703) then
		if (option == 0x00000100) then
			keyItem = 2911 -- Ionos's Webbing
		elseif (option == 0x00000200) then
			keyItem = 2913 -- Nosoi's Feather
		elseif (option == 0x00000300) then
			keyItem = 2915 -- Kamohoalii's Fin
		end
	-- T2 Trade menu (Ethereal Incense)
	elseif (csid == 9704) then
		if (option == 0x00000100) then
			keyItem = 2912 -- Sandy's Lasher
		elseif (option == 0x00000200) then
			keyItem = 2914 -- Brittlis's Ring
		elseif (option == 0x00000300) then
			keyItem = 2916 -- Umdhlebi's Flower
		end
	end
	
	if keyItem ~= 0 then
        if not (player:hasKeyItem(keyItem)) then
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, keyItem)
            player:addKeyItem(keyItem)
            player:confirmTrade()
        else
            player:PrintToPlayer(string.format("You already possess that key item."),tpz.msg.channel.NS_LINKSHELL3)
        end
    end
end