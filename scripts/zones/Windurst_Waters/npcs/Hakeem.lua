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
		1695, 750,		-- Bunch of Habanero Peppers
		4358, 24,		-- Slice of Hare Meat
		1985, 2142,		-- Helmet Mole
		1590, 813,		-- Sprig of Holy Basil
		4370, 90,		-- Pot of Honey
		631, 27,		-- Bag of Horo Flour
		5564, 18000,	-- Chunk of Hydra Meat
		2156, 12,		-- Clump of Imperial Tea Leaves
		2237, 45,		-- Bag of Imperial Flour
		2214, 45,		-- Bag of Imperial Rice
		5453, 600,		-- Istakoz
		5571, 960,		-- Slice of Karakul Meat
		612, 45,		-- Bunch of Kazham Peppers
		4432, 45,		-- Kazham Pineapple
		1982, 615,		-- King Locust
		4386, 4500,		-- King Truffle
		4273, 1050,		-- Kitron
		632, 90,		-- Kukuru Bean
		4400, 840,		-- Slice of Land Crab Meat
		4366, 18,		-- La Theine Cabbage
		4362, 45,		-- Lizard Egg
		5667, 918,		-- Slice of Lynx Meat
		627, 30,		-- Pot of Maple Sugar
		5747, 2562,		-- Jar of Marinara Sauce
		4527, 393,		-- Jug of Mary's Milk
		614, 60,		-- Bulb of Mhaura Garlic
		629, 36,		-- Ear of Millioncorn
		5195, 159,		-- Sprig of Misareaux Parsley
		6466, 7400,		-- Bowl of Miso-based Ramen Soup
		4390, 18,		-- Mithran Tomato
		4567, 200,		-- Moon Carrot
		1983, 921,		-- Mushroom Locust
		5235, 2895,		-- Head of Napa
		5650, 2340,		-- Pair of Nopales
		630, 72,		-- Ogre Pumpkin
		633, 9,			-- Flask of Olive Oil
		5563, 840,		-- Chunk of Orobon Meat
		4468, 60,		-- Bunch of Pamamas
		5740, 435,		-- Cluster of Paprika
		4274, 1425,		-- Persikos
		616, 60,		-- Piece of Pie Dough
		2213, 9,		-- Handful of Pine Nuts
		2561, 600,		-- Piece of Pizza Dough
		5194, 696,		-- Bowl of Pomodoro Sauce
		619, 33,		-- Popoto
		6393, 1260,		-- Cut of Porxie Pork
		4448, 906,		-- Puffball
		5569, 702,		-- Puk Egg
		5682, 4743,		-- Purple Polypore
		9196, 3000,		-- Container of Ramen Noodles
		4444, 15,		-- Rarab Tail
		4449, 3750,		-- Reishi Mushroom
		1652, 525,		-- Bottle of Rice Vinegar
		5649, 141,		-- Handful of Roasted Almonds
		4593, 294,		-- Block of Rock Cheese
		936, 12,		-- Chunk of Rock Salt
		4365, 90,		-- Rolanberry
		4531, 72,		-- Rolanberry (864 C.E.)
		4530, 72,		-- Rolanberry (874 C.E.)
		4529, 72,		-- Rolanberry (881 C.E.)
		5541, 429,		-- Bunch of Royal Grapes
		2272, 231,		-- Bowl of Roast Coffee Beans
		5755, 1290,		-- Slab of Ruszor Meat
		611, 3,			-- Bag of Rye Flour
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