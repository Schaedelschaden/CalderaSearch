-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Amarefice
-- Type: Woodworking Synthesis Image Support
-- !pos -181.506 10.15 259.905 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/shop")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
	
end;

function onTrigger(player,npc)
	local trigger = math.random(1)
	
	if (trigger == 1) then
		player:PrintToPlayer(string.format("Amarefice : Welcome to the woodworking shop!"),tpz.msg.channel.NS_SAY)
    local stock =
    {
        2149, 300,     -- Apkallu Feather
        731, 2000,   -- Aquilaria Log
        688, 10,   -- Arrowwood Log
        698, 140,     -- Ash Log
		704, 2,     -- Bamboo Stick
        1134,60,     -- Bast Parchment
        692, 35,   -- Beech Log
        847, 2,   -- Bird Feather
        845, 500,     -- Black C. Feather
		729, 2000,     -- Bloodwood Log
        1657, 48,     -- Bundling Twine
        400, 400,   -- Cactus Arm
        1762, 2000,   -- Cassia Lumber
        694, 900,     -- Chestnut Log
		840, 4,     -- Chocobo Fthr.
        2150,290,     -- Colibri Feather
        722, 3000,   -- Divine Log
        1444, 3000,   -- Divine Sap
        727, 10,     -- Dogwood Log
		702, 2500,     -- Ebony Log
        690, 800,     -- Elm Log
        1995, 2500,   -- Ether Holly
        2761, 1500,   -- Feyweald Log
        1417, 340,     -- G. Bird Fltchg.
		843, 1000,     -- G. Bird Plume
        842, 300,     -- Giant Bird Fthr.
        2522, 1500,   -- Gnat Wing
        1961, 380,   -- Gold Arrowheads
        4018, 150,     -- Guatambu Log
		1619, 2000,     -- Hippogryph Fthr.
        697, 280,     -- Holly Log
        846, 30,   -- Insect Wing
        2534, 6000,   -- Jacaranda Log
        732, 2000,     -- Kapor Log
		1240, 500,     -- Koma
        1446, 7000,     -- Lacquer Tree Log
        2506, 7000,   -- Ladybug Wing
        1464, 540,   -- Lancewood Log
        689, 10,     -- Lauan Log
		1448, 1500,     -- Lqr. Tree Sap
        2855, 200,     -- Mahogany Htwd.
        700, 4000,     -- Mahogany Log
        691, 30,   -- Maple Log
        699, 40,     -- Oak Log
		3504, 400,     -- Peapuk Wing
        703, 4300,     -- Petrified Log
        844, 3500,   -- Phoenix Feather
        1962, 2300,   -- Plt. Arrowheads
        2148, 300,     -- Puk Wing
		701, 1800,     -- Rosewood Log
        1815, 2408,     -- Sanctified Lbr
        2532, 4000,   -- Teak Log
        4016, 150,   -- Tulfaire Feather
        1415, 9000,     -- Urushi
		1763, 2000,     -- Viridian Urushi
        693, 250,     -- Walnut Log
        695, 80,   -- Willow Log
        1414, 13000,   -- Wisteria Lumber
        841, 10,     -- Yagudo Feather
		696, 100,     -- Yew Log		
    }

    tpz.shop.general(player, stock)

	end
end

function onEventUpdate(player,csid,option)
	
end

function onEventFinish(player,csid,option)
	
end