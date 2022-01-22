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
    local stock =
    {
        2149, 459,		-- Apkallu Feather
		731, 3000,		-- Aquilaria Log
		688, 15,		-- Arrowwood Log
		698, 72,		-- Ash Log
		704, 108,		-- Bamboo Stick
		1134, 90,		-- Bast Parchment
		692, 4785,		-- Beech Log
		847, 3,			-- Bird Feather
		845, 753,		-- Black C. Feather
		729, 3900,		-- Bloodwood Log
		1657, 75,		-- Bundling Twine
		400, 800,		-- Cactus Arm
		1762, 3000,		-- Cassia Lumber
		694, 1413,		-- Chestnut Log
		840, 6,			-- Chocobo Fthr.
		2150, 444,		-- Colibri Feather
		722, 5160,		-- Divine Log
		1444, 4785,		-- Divine Sap
		727, 15,		-- Dogwood Log
		702, 3840,		-- Ebony Log
		690, 1152,		-- Elm Log
		1995, 4488,		-- Ether Holly
		2761, 2310,		-- Feyweald Log
		1417, 510,		-- G. Bird Fltchg.
		843, 1614,		-- G. Bird Plume
		842, 459,		-- Giant Bird Fthr.
		2522, 222,		-- Gnat Wing
		1961, 570,		-- Gold Arrowheads
		--4018, 237,	-- Guatambu Log
		1619, 4284,		-- Hippogryph Fthr.
		697, 429,		-- Holly Log
		846, 60,		-- Insect Wing
		2534, 9000,		-- Jacaranda Log
		732, 3000,		-- Kapor Log
		1240, 495,		-- Koma
		1446, 10500,	-- Lacquer Tree Log
		2506, 264,		-- Ladybug Wing
--		1464, 795,		-- Lancewood Log
		689, 27,		-- Lauan Log
		1448, 2625,		-- Lqr. Tree Sap
		2855, 1750,		-- Mahogany Htwd.
		700, 3300,		-- Mahogany Log
		691, 45,		-- Maple Log
		699, 2370,		-- Oak Log
		3504, 645,		-- Peapuk Wing
		703, 6450,		-- Petrified Log
--		844, 4680,		-- Phoenix Feather
		1962, 3453,		-- Plt. Arrowheads
		2148, 459,		-- Puk Wing
		701, 2760,		-- Rosewood Log
		1815, 3600,		-- Sanctified Lbr
		2532, 6141,		-- Teak Log
		4016, 237,		-- Tulfaire Feather
		3926, 9240,     -- Urunday Log
		1415, 12255,	-- Urushi
		1763, 3000,		-- Viridian Urushi
		693, 366,		-- Walnut Log
		695, 120,		-- Willow Log
		1414, 18531,	-- Wisteria Lumber
		841, 30,		-- Yagudo Feather
		696, 267,		-- Yew Log	
    }

    tpz.shop.general(player, stock)
	
	player:PrintToPlayer(string.format("Amarefice : Welcome to Caldera's woodworking shop!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player,csid,option)
	
end

function onEventFinish(player,csid,option)
	
end