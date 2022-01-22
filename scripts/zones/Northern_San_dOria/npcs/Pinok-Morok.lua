-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Pinok-Morok
-- Type: Smithing Synthesis Image Support
-- !pos -186.650 10.25 148.380 231
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/crafting")
require("scripts/globals/shop")
local ID = require("scripts/zones/Northern_San_dOria/IDs")
-----------------------------------

	
function onTrade(player,npc,trade)
	
end

function onTrigger(player,npc)
    local stock =
    {
		1229, 3334,		-- Adaman Nugget
		646, 10000,		-- Adaman Ore
		675, 4536,		-- Adaman Scales
		4058, 80000,	-- Bismuth Ore
		1232, 36,		-- Bronze Nugget
		672, 78,		-- Bronze Scales
		1230, 33,		-- Copper Nugget
		640, 9,			-- Copper Ore
		645, 1425,		-- Darksteel Ore
		2000, 4242,		-- Dark Adaman
		1989, 1170,		-- Dark Bronze
		1773, 2910,		-- Dark Scales
		1228, 639,		-- Dst. Nugget
		756, 3675,		-- Durium Ore
		2764, 3120,		-- Dweomer Steel
		1287, 6240,		-- Frigid Core
		1654, 540,		-- Igneous Rock
		1284, 6054,		-- Inferno Core
		2823, 4194,		-- Iridium
		1234, 225,		-- Iron Nugget
		643, 450,		-- Iron Ore
		1155, 237,		-- Iron Sand
		674, 3213,		-- Iron Scales
		2006, 2958,		-- Iyo Scale
		685, 2175,		-- Khroma Ore
		2711, 705,		-- Khroma Nugget
		1703, 1050,		-- Kunwu Ore
		1681, 2298,		-- Light Steel
		2135, 984,		-- Lucent Steel
		2134, 984,		-- Lucent Iron
		1285, 6240,		-- Luminous Core
		2886, 612,		-- Mildewy Ingot
		647, 15000,		-- Molybdenum Ore
		2531, 561,		-- Obsidian
		2860, 1320,		-- Plumbago
--		1466, 795,		-- Relic Iron
		1467, 15900,	-- Relic Steel
		4023, 237,		-- Snowsteel Ore
		1286, 6240,		-- Spirit Core
		1235, 270,		-- Steel Nugget
		676, 4200,		-- Steel Scales
		2763, 1440,		-- Swamp Ore
		657, 2712,		-- Tama-Hagane
		641, 30,		-- Tin Ore
		4020, 237,		-- Titanium Ore
		2303, 4044,		-- Tr. Brz. Sheet
--		3447, 15699,	-- Voidwrought Plate
--		1469, 795,		-- Wootz Ore
		2144, 57,		-- Workshop Anvil
    }

    tpz.shop.general(player, stock)
	
	player:PrintToPlayer(string.format("Pinok-Morok : Welcome to Caldera's Smithing shop!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player,csid,option)
	
end

function onEventFinish(player,csid,option)
	
end