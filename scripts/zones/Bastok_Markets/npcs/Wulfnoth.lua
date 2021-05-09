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
        2417, 200,		-- Aht Urhgan Brass
        678, 400,		-- Aluminum Ore
        814, 610,		-- Amber
        800, 440,		-- Amethyst
		811, 2240,		-- Ametrine
        813, 36960,		-- Angelstone
        791, 34635,		-- Aquamarine
        3321, 12000,	-- Aqua Gem
        3302, 500,		-- Aqua Geode
		1677, 2200,		-- Aqueous Ocl.
        1834, 4348,		-- Ardent Jadeite
        2305, 70,		-- Auric Sand
        779, 6000,		-- Aventurine
        2877, 3090,		-- Befouled Silver
		1679, 4640,		-- Bewitched Gold
        793, 2500,		-- Black Pearl
        775, 400,		-- Black Rock
        2847, 200,		-- Blue Jasper
        770, 410,		-- Blue Rock
		650, 90,		-- Brass Ingot
        1231, 1800,		-- Brass Nugget
        1656, 500,		-- Brass Tank
        3318, 12000,	-- Breeze Gem
        3299, 400,		-- Breeze Geode
		3526, 600,		-- Carbite
        767, 6300,		-- Carnelian
        801, 4500,		-- Chrysoberyl
        780, 6080,		-- Clarite
        809, 350,		-- Clear Topaz
		2859, 2010,		-- Cobalt Ore
        1306, 2180,		-- Dark Bead
        1262, 7030,		-- Dark Ore
        738, 8000,		-- Platinum Ore
        812, 50000,		-- Deathstone
		2151, 200,		-- Marid Hide
        2887, 300,		-- Decayed Ingot
        787, 52700,		-- Diamond
        1302, 2240,		-- Earth Bead
        1258, 7010,		-- Earth Ore
		1664, 800,		-- Eastern Gem
        785, 48200,		-- Emerald
        3527, 640,		-- Fenrite
        1299, 2300,		-- Fire Bead
        1255, 7040,		-- Fire Ore
		3316, 12000,	-- Flame Gem
        2842, 6300,		-- Flawed Garnet
        768, 8,			-- Flint Stone
        810, 24000,		-- Fluorite
        2765, 1100,		-- Fool's Gold Ore
		1676, 2000,		-- Frgd. Orichalcum
        777, 408,		-- Fulmenite
        790, 3000,		-- Garnet
        3522, 600,		-- Garudite
        2360, 1500,		-- Golden Gear
		2508, 100,		-- Gold Dust
        1225, 150,		-- Gold Nugget
        737, 880,		-- Gold Ore
        808, 2000,		-- Goshenite
        1465, 5010,		-- Granite
		772, 410,		-- Green Rock
		778, 6010,		-- Heliodor
		1300, 7100,		-- Ice Bead
	    1256, 7010,		-- Ice Ore
		3520, 800,		-- Ifritite
        1674, 4200,		-- Indurated Gold
        1740, 640,		-- Iolite
        784, 32300,		-- Jadeite
        2880, 1040,		-- Kidney Stone
		1460, 2090,		-- Koh-I-Noor
        795, 300,		-- Lapis Lazuli
        781, 6000,		-- Larimar
        3525, 600,		-- Leviatite
        1303, 2100,		-- Lightning Bead
		1259, 7000,		-- Lightning Ore
        1305, 2408,		-- Light Bead
        3322, 12000,	-- Light Gem
        3303, 400,		-- Light Geode
        796, 500,		-- Light Opal
		1261, 7100,		-- Light Ore
        2228, 1950,		-- Luminium Ore
    }
	
	player:PrintToPlayer(string.format("Wulfnoth : Welcome to Caldera's Goldsmithing shop!"),tpz.msg.channel.NS_SAY)

    tpz.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
	
end

function onEventFinish(player,csid,option)
	
end