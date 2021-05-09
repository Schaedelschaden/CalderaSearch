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
        1229, 600,   -- Adaman Nugget
        646, 1300,   -- Adaman Ore
        675, 1400,   -- Adaman Scales
        4058, 1800,  -- Bismuth Ore
		1232, 260,   -- Bronze Nugget
        672, 60,     -- Bronze Scales
        1230, 35,    -- Copper Nugget
        640, 2,      -- Copper Ore
        645, 1500,   -- Darksteel Ore
		2000, 2000,  -- Dark Adaman
        1989, 748,   -- Dark Bronze
        1773, 1400,  -- Dark Scales
        1228, 400,   -- Dst. Nugget
        756, 2900,   -- Durium Ore
		2764, 354,   -- Dweomer Steel
        1287,4290,   -- Frigid Core
        1654, 300,   -- Igneous Rock
        1284, 3000,  -- Inferno Core
        2823, 2010,  -- Iridium
		1234, 100,   -- Iron Nugget
        643, 200,    -- Iron Ore
        1155, 250,   -- Iron Sand
        674, 1500,   -- Iron Scales 
        2006, 340,   -- Iyo Scale
		685, 1400,   -- Khroma Ore
        2711, 300,   -- Khroma Nugget
        1703, 400,   -- Kunwu Ore
        1681, 380,   -- Light Steel
        2135, 650,   -- Lucent Steel
		2134, 600,   -- Lucent Iron
        1285, 3280,  -- Luminous Core
        2886, 430,   -- Mildewy Ingot
        647, 1000,   -- Molybdenum Ore
        2531, 300,   -- Obsidian
		2860, 500,   -- Plumbago
        1466, 1000,  -- Relic Iron
        1467, 7000,  -- Relic Steel
        4023, 540,   -- Snowsteel Ore
        1286, 1810,  -- Spirit Core
		1235, 150,   -- Steel Nugget
        676, 2000,   -- Steel Scales
        2763, 900,   -- Swamp Ore
        657, 1030,   -- Tama-Hagane
        641, 40,     -- Tin Ore
		4020, 100,   -- Titanium Ore
        2303, 2300,  -- Tr. Brz. Sheet
        3447, 2500,  -- Voidwrought Plate
        1469, 300,   -- Wootz Ore
        2144, 30,    -- Workshop Anvil
    }

    tpz.shop.general(player, stock)
	
	player:PrintToPlayer(string.format("Pinok-Morok : Welcome to Caldera's Smithing shop!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player,csid,option)
	
end

function onEventFinish(player,csid,option)
	
end