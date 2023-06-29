-----------------------------------
-- Area: Bastok Mines
--  NPC: Azima
-- Alchemy Adv. Synthesis Image Support
-- !pos 123.5 2 1 234
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/crafting")
local ID = require("scripts/zones/Bastok_Mines/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    -- local guildMember = isGuildMember(player, 1)
    -- local SkillLevel = player:getSkillLevel(tpz.skill.ALCHEMY)
    -- local Cost = getAdvImageSupportCost(player, tpz.skill.ALCHEMY)

    -- if (guildMember == 1) then
        -- if (player:hasStatusEffect(tpz.effect.ALCHEMY_IMAGERY) == false) then
            -- player:startEvent(122, Cost, SkillLevel, 0, 0xB0001AF, player:getGil(), 0, 0, 0) -- Event doesn't work
        -- else
            -- player:startEvent(122, Cost, SkillLevel, 0, 0xB0001AF, player:getGil(), 0x6FE2, 0, 0)
        -- end
    -- else
        -- player:startEvent(122)
    -- end
	
	local stock =
    {
		1979, 510,		-- Cup of Leech Saliva
		2155, 960,		-- Lesser Chigoe
		956, 90,		-- Lilac
		2013, 1188,		-- Vial of Lizard Blood
		926, 84,		-- Lizard Tail
		2507, 360,		-- Lycopodium Flower
		2777, 117,		-- Vial of Magicked Blood
		954, 1920,		-- Magic Pot Shard
		920, 723,		-- Malboro Vine
		4017, 978,		-- Mandragora Sprout
		958, 87,		-- Marguerite
		1468, 9900,		-- Flask of Marksman's Oil
		914, 900,		-- Vial of Mercury
		2459, 25245,	-- Pinch of Minium
		918, 1413,		-- Sprig of Mistletoe
		5165, 600,		-- Bottle of Movalpolos Water
		1308, 2550,		-- Mythril Leaf
		1412, 918,		-- Olive Flower
		2154, 540,		-- Orobon Lure
		2126, 642,		-- Chunk of Orpiment
		1283, 4173,		-- Ose Whisker
		5351, 306,		-- Phial of Osseous Serum
		9259, 60,		-- Chunk of Pagodite
		938, 33,		-- Sprig of Papaka Grass
		945, 1164,		-- Pinch of Paralysis Dust
		2524, 1152,		-- Peiste Stinger
		2164, 48,		-- Pephredo Hive Chip
		1411, 2289,		-- Phalaenopsis
		942, 11700,		-- Philosopher's Stone
		1717, 612,		-- Bottle of Photoanima
		2310, 6,		-- Vial of Plasma Oil
		1310, 5250,		-- Platinum Leaf
		943, 243,		-- Pinch of Poison Dust
		952, 312,		-- Bag of Poison Flour
		2301, 324,		-- Square of Polyflan
		2316, 3,		-- Sheet of Polyflan Paper
		2514, 1695,		-- Rafflesia Petal
		2513, 1404,		-- Rafflesia Vine
		949, 69,		-- Rain Lily
		941, 60,		-- Red Rose
		2800, 75,		-- Flasque of Revertant
		2768, 150,		-- Flasque of Revertant Singulus
		940, 156,		-- Revival Tree Root
		936, 12,		-- Chunk of Rock Salt
		2465, 15000,	-- Rubber Cap
		2468, 15000,	-- Rubber Chausses
		2467, 15000,	-- Rubber Gloves
		2466, 15000,	-- Rubber Harness
		2469, 15000,	-- Rubber Soles
		1893, 480,		-- Onz of Salinator
		4030, 12540,	-- Pot of Sekishitsu
		1886, 1308,		-- Bottle of Sieglinde Putty
		1888, 774,		-- Sack of Silica
		1307, 726,		-- Silver Leaf
		1521, 795,		-- Vial of Slime Juice
		637, 750,		-- Vial of Slime Oil
		2509, 300,		-- Slug Eye
		1725, 90,		-- Snow Lily
		2335, 2799,		-- Soulflayer Tentacle
		5352, 336,		-- Phial of Spectral Serum
		1108, 135,		-- Pinch of Sulfur
		1772, 1557,		-- Chunk of Super Cermet
		1410, 1098,		-- Sweet William
		1621, 3711,		-- Taurus Wing
		-- 4074, 40425,	-- Thought Crystal
		915, 1800,		-- Jar of Toad Oil
		953, 114,		-- Treant Bulb
		2131, 75,		-- Triturator
		1241, 231,		-- Pinch of Twinkle Powder
		944, 621,		-- Pinch of Venom Dust
		2374, 4368,		-- Pinch of Viper Dust
		5350, 234,		-- Phial of Volant Serum
		1813, 720,		-- Pot of Vermilion Lacquer
		2338, 936,		-- Wamoura Scale
		2960, 135,		-- Water Lily
		1889, 774,		-- Sack of White Sand
		951, 90,		-- Wijnruit
		2364, 453,		-- Piece of Yellow Ginseng
		1885, 555,		-- Chunk of Zincite
		1884, 243,		-- Pinch of Zinc Oxide
	}
	
	tpz.shop.general(player, stock)
	
	player:PrintToPlayer(string.format("Azima: Welcome to Caldera's Alchemy shop!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- local Cost = getAdvImageSupportCost(player, tpz.skill.ALCHEMY)

    -- if (csid == 122 and option == 1) then
        -- player:delGil(Cost)
        -- player:messageSpecial(ID.text.ALCHEMY_SUPPORT, 0, 7, 0)
        -- player:addStatusEffect(tpz.effect.ALCHEMY_IMAGERY, 3, 0, 480)
    -- end
end