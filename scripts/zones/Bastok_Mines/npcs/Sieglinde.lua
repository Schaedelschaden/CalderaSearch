-----------------------------------
-- Area: Bastok Mines
--  NPC: Sieglinde
-- Alchemy Synthesis Image Support
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/crafting")
local ID = require("scripts/zones/Bastok_Mines/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    -- local guildMember = isGuildMember(player, 1)
    -- local SkillCap = getCraftSkillCap(player, tpz.skill.SMITHING)
    -- local SkillLevel = player:getSkillLevel(tpz.skill.SMITHING)

    -- if (guildMember == 1) then
        -- if (player:hasStatusEffect(tpz.effect.ALCHEMY_IMAGERY) == false) then
            -- player:startEvent(124, SkillCap, SkillLevel, 2, 201, player:getGil(), 0, 4095, 0)
        -- else
            -- player:startEvent(124, SkillCap, SkillLevel, 2, 201, player:getGil(), 7009, 4095, 0)
        -- end
    -- else
        -- player:startEvent(124)
    -- end
	
	local stock =
    {
		1641, 15000, 	-- Fire Anima
		1642, 15000, 	-- Ice Anima
		1643, 15000, 	-- Wind Anima
		1644, 15000, 	-- Earth Anima
		1645, 15000, 	-- Lightning Anima
		1646, 15000, 	-- Water Anima
		1647, 15000, 	-- Light Anima
		1648, 15000, 	-- Dark Anima
		1265, 6000,		-- Four-Leaf Korrigan Bud
		921, 45,		-- Bottle of Ahriman Tears
		935, 1032,		-- Ahriman Wing
		-- 957, 90,		-- Amaryllis
		2361, 2250,		-- Ameretat Vine
		2752, 3300,		-- Amphiptere Whisker
		937, 90,		-- Block of Animal Glue
		2845, 4755,		-- Loop of Aramid Fiber
		1109, 930,		-- Artificial Lens
		1626, 10800,	-- Bottle of Avatar Blood
		2113, 204,		-- Sack of Baking Soda
		922, 45,		-- Bat Wing
		2015, 786,		-- Vial of Beast Blood
		912, 30,		-- Beehive Chip
		913, 90,		-- Lump of Beeswax
		2014, 459,		-- Vial of Bird Blood
		2109, 984,		-- Bowl of Bittern
		929, 120,		-- Jar of Black Ink
		928, 309,		-- Pinch of Bomb Ash
		919, 921,		-- Clump of Boyahda Moss
		1775, 2022,		-- Jar of Brimsand
		916, 558,		-- Cactuar Needle
		1592, 3180,		-- Cactuar Root
		4246, 8745,		-- Bottle of Cantarella
		2464, 291,		-- Bottle of Carbon Dioxide
		932, 582,		-- Loop of Carbon Fiber
		-- 948, 45,		-- Carnation
		1120, 900,		-- Casablanca
		2792, 75,		-- Flasque of Catalytic Oil
		1413, 900,		-- Cattleya
		931, 1500,		-- Cermet Chunk
		2229, 720,		-- Vial of Chimera Blood
		1630, 933,		-- Pinch of Cluster Ash
		927, 630,		-- Coeurl Whisker
		946, 1269,		-- Pinch of Crystal Dust
		-- 959, 90,		-- Dahlia
		2365, 1002,		-- Vial of Demon Blood
		1892, 75,		-- Onz of Desalinator
		2549, 2310,		-- Pinch of Djinn Ash
		1165, 3120,		-- Doll Shard
		1133, 5700,		-- Vial of Dragon Blood
		1443, 2037,		-- Pinch of Dried Mugwort
		923, 723,		-- Dryad Root
		2713, 546,		-- Sprig of Dyer's Woad
		2300, 336,		-- Square of Ebonite
		2774, 117,		-- Jar of Enchanted Ink
		2875, 2400,		-- Ethereal Squama
		1814, 738,		-- Pot of Ethereal Vermilion Lacquer
		2460, 4242,		-- Flint Glass Sheet
		924, 363,		-- Vial of Fiend Blood
		947, 960,		-- Jar of Firesand
		2175, 105,		-- Chunk of Flan Meat
		1282, 2772,		-- Flauros Whisker
		1882, 282,		-- Flask of Flaxseed Oil
		1617, 4050,		-- Flytrap Leaf
		1524, 240,		-- Sprig of Fresh Mugwort
		1519, 795,		-- Fresh Orc Liver
		1445, 16125,	-- Freya's Tear
		4076, 40425,	-- Fulfillment Crystal
		2749, 3486,		-- Gargouille Eye
		925, 486,		-- Giant Stinger
		933, 480,		-- Loop of Glass Fiber
		1887, 2556,		-- Glass Sheet
		1309, 3600,		-- Gold Leaf
		955, 3120,		-- Golem Shard
		1264, 12375,	-- Clump of Great Boyahda Moss
		939, 450,		-- Hecteyes Eye
		2362, 186,		-- Chunk of High Ebonite
		2309, 771,		-- Bundle of Homunculus Nerves
		4075, 40425,	-- Hope Crystal
		-- 2729, 75,		-- Hydrangea
		2290, 3501,		-- Chunk of Imperial Cermet
		2840, 0,		-- Imperial Topaz
		2163, 48,		-- Imp Wing
		2475, 1563,		-- Chunk of Kaolin
		2373, 4200,		-- Khimaira Tail
	}
	
	tpz.shop.general(player, stock)
	
	player:PrintToPlayer(string.format("Sieglinde: Welcome to Caldera's Alchemy shop!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- if (csid == 124 and option == 1) then
        -- player:messageSpecial(ID.text.ALCHEMY_SUPPORT, 0, 7, 2)
        -- player:addStatusEffect(tpz.effect.ALCHEMY_IMAGERY, 1, 0, 120)
    -- end
end
