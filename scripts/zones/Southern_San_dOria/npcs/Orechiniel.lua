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
        1275, 2000,     -- Amemet Skin
        2750, 2000,     -- Amphiptere Hide
        862, 2010,      -- Behem. Leather
        1628, 2140,     -- Buffalo Hide
		1640, 240,      -- Bugard Skin
        871, 960,       -- Calig. Wolf Hide
        2123, 635,      -- Catoblepas Hide
        854, 1002,      -- Cockatrice Skin
        863, 1500,      -- Coeurl Hide
		2839, 200,      -- Coquecigr. Skin
        857, 348,       -- Dhalmel Hide
        1623, 400,      -- Eft Skin
        2189, 2000,     -- Fiendish Skin
        2773, 90,       -- Fine Parchment
		2139, 640,      -- Fr. Dhalmel Hide
        850, 500,       -- Sheep Leather
        2423, 1000,     -- Frigid Skin
        1516, 1000,     -- Griffon Hide
        1680, 810,      -- H.Q. Bugard Skin
		1591, 800,      -- H.Q. Coeurl Hide
        1741, 800,      -- H.Q. Eft Skin
        1765, 1500,     -- Habu Skin
        2828, 500,      -- Herensugue Skin
        2834, 340,      -- Immortal Molt
		878, 10,        -- Karakul Skin
        2497, 9300,     -- Kukulkan's Skin
        1869, 500,      -- Lamia Skin
        1655, 780,      -- Leather Pouch
        1277, 3150,     -- Lindwurm Skin
		869, 10,        -- Lizard Molt
        852, 180,       -- Lizard Skin
        2512, 30,       -- Lynx Hide
        876, 2000,      -- Manta Skin
        1116, 1000,     -- Manticore Hide
		2151, 200,      -- Marid Hide
        1293, 3000,     -- Narasimha Hide
        2121, 700,      -- Ovinnik Hide
        917, 240,       -- Parchment
        2523, 1010,     -- Peiste Skin
		2570, 2500,     -- Pelt Of Dawon
        8707, 200,      -- Raaz Hide
        856, 40,        -- Rabbit Hide
        859, 300,       -- Ram Skin
        853, 940,       -- Raptor Skin
		2837, 400,      -- Ratatoskr Pelt
        2755, 2300,     -- Ruszor Hide
        2824, 2500,     -- Shagreen
        2518, 900,      -- Smilodon Hide
        2129, 100,      -- Tanning Vat
		1276, 5800,     -- Tarasque Skin
        861, 408,       -- Tiger Hide
        849, 1000,      -- Undead Skin
        2550, 400,      -- Vellum
        2003, 1000,     -- White Mouton
		2428, 2000,     -- Wivre Hide
        858, 250,       -- Wolf Hide
        2836, 280,      -- Woolly Pelage
        1122, 1000,     -- Wyvern Skin
        2188, 2010,     -- Wyvern Tailskin
		1124, 4100,     -- Wyvern Wing
		2125, 2010,     -- Yellow Mouton
		1296, 2100,     -- Yowie Skin
    }
	
	player:PrintToPlayer(string.format("Orechiniel : Welcome to Caldera's Leathercraft shop!"),tpz.msg.channel.NS_SAY)

    tpz.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
	
end

function onEventFinish(player,csid,option)
	
end