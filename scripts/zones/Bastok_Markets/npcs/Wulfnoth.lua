-----------------------------------
-- Area: Bastok Markets
--  NPC: Wulfnoth
-- Type: Goldsmithing Synthesis Image Support
-- !pos -211.937 -7.814 -56.292 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/shop")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
	
end;

function onTrigger(player,npc)
    local stock =
    {
		2417, 246,		-- Chunk of Aht Urhgan Brass
		678, 612,		-- Chunk of Aluminum Ore
		814, 984,		-- Amber Stone
		800, 621,		-- Amethyst
		--811, 3600,		-- Ametrine
		813, 11400,		-- Angelstone
		791, 7344,		-- Aquamarine
		3321, 11961,	-- Aqua Gem
		3302, 600,		-- Aqua Geode
		1677, 4389,		-- Aqueous Orichalcum Ingot
		1834, 4010,		-- Ardent Jadeite
		2305, 105,		-- Handful of Auric Sand
		779, 3584,		-- Aventurine
		2877, 4935,		-- Ingot of Befouled Silver
		1679, 6408,		-- Bewitched Gold Ingot
		793, 3600,		-- Black Pearl
		775, 606,		-- Black Rock
		2847, 870,		-- Blue Jasper
		770, 612,		-- Blue Rock
		650, 144,		-- Brass Ingot
		1231, 15,		-- Brass Nugget
		1656, 630,		-- Brass Tank
		3318, 135,		-- Breeze Gem
		3299, 600,		-- Breeze Geode
		--3526, 900,		-- Carbite
		767, 4000,		-- Carnelian
		801, 7380,		-- Chrysoberyl
		--780, 4075,		-- Clarite
		809, 600,		-- Clear Topaz
		2859, 3180,		-- Chunk of Cobalt Ore
		1306, 11961,	-- Dark Bead
		1262, 11118,	-- Chunk of Dark Ore
--		812, 11400,		-- Deathstone
		2887, 612,		-- Decayed Ingot
		787, 11400,		-- Diamond
--		756, 62500,		-- Chunk of Durium Ore
		1302, 11961,	-- Earth Bead
		1258, 11118,	-- Chunk of Earth Ore
		1664, 1452,		-- Eastern Gem
		785, 11400,		-- Emerald
		--3527, 900,		-- Fenrite
		1299, 11961,	-- Fire Bead
		1255, 11118,	-- Chunk of Fire Ore
		3316, 135,		-- Flame Gem
		3297, 600,		-- Flame Geode
		2842, 810,		-- Flawed Garnet
		768, 15,		-- Flint Stone
		810, 6984,		-- Fluorite
		2765, 2100,		-- Chunk of Fool's Gold Ore
		1676, 4440,		-- Frigid Orichalcum Ingot
		--777, 3952,		-- Fulmenite
		790, 3600,		-- Garnet
		--3522, 900,		-- Garudite
		2360, 2664,		-- Golden Gear
		2508, 180,		-- Pinch of Gold Dust
		1225, 525,		-- Gold Nugget
		737, 1260,		-- Chunk of Gold Ore
		--808, 3600,		-- Goshenite
		1465, 7950,		-- Slab of Granite
		772, 615,		-- Green Rock
		778, 9000,		-- Heliodor
		1300, 11961,	-- Ice Bead
		1256, 11118,	-- Chunk of Ice Ore
		--3520, 900,		-- Ifritite
		1674, 6456,		-- Indurated Gold Ingot
		--1740, 900,		-- Iolite
		--784, 7200,		-- Jadeite
		2880, 2829,		-- Kidney Stone
		1460, 29811,	-- Koh-I-Noor
		795, 636,		-- Lapis Lazuli
		781, 3401,		-- Larimar
		3525, 900,		-- Leviatite
		1303, 11961,	-- Lightning Bead
		1259, 10875,	-- Chunk of Lightning Ore
		1305, 11961,	-- Light Bead
		3322, 135,		-- Light Gem
		3303, 600,		-- Light Geode
		796, 621,		-- Light Opal
		1261, 11118,	-- Chunk of Light Ore
		2228, 2970,		-- Chunk of Luminium Ore
    }
	
	player:PrintToPlayer(string.format("Wulfnoth : Welcome to Caldera's Goldsmithing shop!"),tpz.msg.channel.NS_SAY)

    tpz.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
	
end

function onEventFinish(player,csid,option)
	
end