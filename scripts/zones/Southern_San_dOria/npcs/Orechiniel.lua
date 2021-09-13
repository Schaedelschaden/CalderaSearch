-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Orechiniel
-- Type: Leathercraft Adv. Synthesis Image Support
-----------------------------------
require("scripts/globals/shop")
require("scripts/globals/settings")
require("scripts/globals/status")
local ID = require("scripts/zones/Southern_San_dOria/IDs")
-----------------------------------

function onTrade(player,npc,trade)
	
end

function onTrigger(player,npc)	
    local stock =
    {
		1275, 3186,		-- Amemet Skin
		2750, 3660,		-- Amphiptere Hide
--		860, 250000,	-- Behemoth Hide
		1628, 5700,		-- Buffalo Hide
		1640, 630,		-- Bugard Skin
		871, 1479,		-- Calig. Wolf Hide
		2123, 972,		-- Catoblepas Hide
		854, 1767,		-- Cockatrice Skin
		863, 1800,		-- Coeurl Hide
		2839, 600,		-- Coquecigrue Skin
		857, 600,		-- Dhalmel Hide
		1623, 750,		-- Eft Skin
		2189, 4350,		-- Fiendish Skin
		2773, 117,		-- Fine Parchment
		2139, 1035,		-- Fr. Dhalmel Hide
		850, 150,		-- Sheep Leather
		2423, 2514,		-- Frigid Skin
--		1516, 795,		-- Griffon Hide
		1680, 1236,		-- H.Q. Bugard Skin
		1591, 2580,		-- H.Q. Coeurl Hide
		1741, 900,		-- H.Q. Eft Skin
		1765, 1557,		-- Habu Skin
		2828, 600,		-- Herensugue Skin
		2834, 600,		-- Immortal Molt
		878, 57,		-- Karakul Skin
		2497, 15120,	-- Kukulkan's Skin
		1869, 1161,		-- Lamia Skin
		1655, 543,		-- Leather Pouch
		1277, 5850,		-- Lindwurm Skin
		869, 15,		-- Lizard Molt
		852, 195,		-- Lizard Skin
		2512, 2160,		-- Lynx Hide
		876, 3051,		-- Manta Skin
		1116, 2280,		-- Manticore Hide
		2151, 5700,		-- Marid Hide
		1293, 4455,		-- Narasimha Hide
		2121, 750,		-- Ovinnik Hide
		917, 315,		-- Parchment
		2523, 1536,		-- Peiste Skin
		2570, 4725,		-- Pelt Of Dawon
		8707, 1350,		-- Raaz Hide
		856, 45,		-- Rabbit Hide
		859, 750,		-- Ram Skin
		853, 1437,		-- Raptor Skin
		2837, 600,		-- Ratatoskr Pelt
		2755, 3303,		-- Ruszor Hide
		2824, 3792,		-- Shagreen
		2518, 1440,		-- Smilodon Hide
		2129, 72,		-- Tanning Vat
		1276, 8700,		-- Tarasque Skin
		861, 1050,		-- Tiger Hide
		849, 2400,		-- Undead Skin
		2550, 600,		-- Vellum
		2003, 2592,		-- White Mouton
		2428, 3150,		-- Wivre Hide
		858, 387,		-- Wolf Hide
		2836, 2750,		-- Woolly Pelage
		1122, 2880,		-- Wyvern Skin
		2188, 3600,		-- Wyvern Tailskin
		1124, 6078,		-- Wyvern Wing
		2125, 3846,		-- Yellow Mouton
		1296, 3600,		-- Yowie Skin
    }
	
	player:PrintToPlayer(string.format("Orechiniel : Welcome to Caldera's Leathercraft shop!"),tpz.msg.channel.NS_SAY)

    tpz.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
	
end

function onEventFinish(player,csid,option)
	
end