-----------------------------------
-- Area: Windurst Waters
--  NPC: Hakeem
-- Type: Cooking Image Support
-- !pos -123.120 -2.999 65.472 238
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/crafting")
local ID = require("scripts/zones/Windurst_Waters/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    -- local guildMember = isGuildMember(player, 4)
    -- local SkillCap = getCraftSkillCap(player, tpz.skill.COOKING)
    -- local SkillLevel = player:getSkillLevel(tpz.skill.COOKING)

    -- if (guildMember == 1) then
        -- if (player:hasStatusEffect(tpz.effect.COOKING_IMAGERY) == false) then
            -- player:startEvent(10017, SkillCap, SkillLevel, 2, 495, player:getGil(), 0, 4095, 0) -- p1 = skill level
        -- else
            -- player:startEvent(10017, SkillCap, SkillLevel, 2, 495, player:getGil(), 7094, 4095, 0)
        -- end
    -- else
        -- player:startEvent(10017) -- Standard Dialogue
    -- end
	
	local stock =
    {
		1695, 500,		-- Bunch of Habanero Peppers
		4358, 16,		-- Slice of Hare Meat
		1985, 1428,		-- Helmet Mole
		1590, 542,		-- Sprig of Holy Basil
		4370, 58,		-- Pot of Honey
		631, 18,		-- Bag of Horo Flour
		5564, 11640,	-- Chunk of Hydra Meat
		2156, 8,		-- Clump of Imperial Tea Leaves
		2237, 30,		-- Bag of Imperial Flour
		2214, 30,		-- Bag of Imperial Rice
		5453, 1168,		-- Istakoz
		5571, 640,		-- Slice of Karakul Meat
		612, 30,		-- Bunch of Kazham Peppers
		4432, 30,		-- Kazham Pineapple
		1982, 410,		-- King Locust
		4386, 3060,		-- King Truffle
		4273, 684,		-- Kitron
		632, 60,		-- Kukuru Bean
		4400, 542,		-- Slice of Land Crab Meat
		4366, 12,		-- La Theine Cabbage
		4362, 30,		-- Lizard Egg
		5667, 612,		-- Slice of Lynx Meat
		627, 20,		-- Pot of Maple Sugar
		5747, 1708,		-- Jar of Marinara Sauce
		4527, 262,		-- Jug of Mary's Milk
		614, 40,		-- Bulb of Mhaura Garlic
		629, 24,		-- Ear of Millioncorn
		5195, 1078,		-- Sprig of Misareaux Parsley
		4390, 12,		-- Mithran Tomato
		4567, 200,		-- Moon Carrot
		1983, 614,		-- Mushroom Locust
		5235, 1930,		-- Head of Napa
		5650, 1560,		-- Pair of Nopales
		630, 48,		-- Ogre Pumpkin
		633, 6,			-- Flask of Olive Oil
		5563, 570,		-- Chunk of Orobon Meat
		4468, 40,		-- Bunch of Pamamas
		5740, 290,		-- Cluster of Paprika
		4274, 950,		-- Persikos
		616, 40,		-- Piece of Pie Dough
		2213, 6,		-- Handful of Pine Nuts
		2561, 400,		-- Piece of Pizza Dough
		5194, 464,		-- Bowl of Pomodoro Sauce
		619, 22,		-- Popoto
		4448, 604,		-- Puffball
		5569, 468,		-- Puk Egg
		5682, 3162,		-- Purple Polypore
		4444, 10,		-- Rarab Tail
		4449, 2500,		-- Reishi Mushroom
		1652, 984,		-- Bottle of Rice Vinegar
		5649, 94,		-- Handful of Roasted Almonds
		4593, 196,		-- Block of Rock Cheese
		936, 6,			-- Chunk of Rock Salt
		4365, 60,		-- Rolanberry
		4531, 48,		-- Rolanberry (864 C.E.)
		4530, 48,		-- Rolanberry (874 C.E.)
		4529, 48,		-- Rolanberry (881 C.E.)
		5541, 286,		-- Bunch of Royal Grapes
		2272, 154,		-- Bowl of Roast Coffee Beans
		5755, 860,		-- Slab of Ruszor Meat
		611, 2,			-- Bag of Rye Flour
	}
	
	tpz.shop.general(player, stock)
	
	player:PrintToPlayer(string.format("Hakeem: Welcome to Caldera's Cooking shop!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- if (csid == 10017 and option == 1) then
        -- player:messageSpecial(ID.text.COOKING_SUPPORT, 0, 8, 2)
        -- player:addStatusEffect(tpz.effect.COOKING_IMAGERY, 1, 0, 120)
    -- end
end