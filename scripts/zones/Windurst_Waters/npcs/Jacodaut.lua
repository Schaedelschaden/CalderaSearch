-----------------------------------
-- Area: Windurst Waters
--  NPC: Jacodaut
-- Type: Cooking Image Support
-- !pos -125.890 -2.999 62.499 238
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
            -- player:startEvent(10016, SkillCap, SkillLevel, 1, 495, player:getGil(), 0, 4095, 0) -- p1 = skill level
        -- else
            -- player:startEvent(10016, SkillCap, SkillLevel, 1, 495, player:getGil(), 7180, 4095, 0)
        -- end
    -- else
        -- player:startEvent(10016) -- Standard Dialogue
    -- end
	local stock =
    {
		4504, 4, 		-- Acorn
		5680, 2474, 	-- Agaricus Mushroom
		5649, 70, 		-- Handful of Roasted Almonds
		5568, 508,		-- Apkallu Egg
		1523, 158,		-- Sprig of Apple Mint
		625, 44,		-- Bottle of Apple Vinegar
		8800, 80,		-- Azuki Bean
		623, 50,		-- Handful of Bay Leaves
		4571, 50,		-- Clump of Beaugreens
		4570, 28,		-- Bird Egg
		626, 104,		-- Pinch of Black Pepper
		1102, 50,		-- Bunch of Blazing Peppers
		618, 12,		-- Pod of Blue Peas
		4503, 76,		-- Bunch of Buburimu Grapes
		2702, 816,		-- Bag of Buckwheat Flour
		5152, 640,		-- Slice of Buffalo Meat
		5651, 1496,		-- Burdock Root
		5908, 200,		-- Butterpear
		5565, 1778,		-- Slice of Cerberus Meat
		5684, 390,		-- Wedge of Chalaimbille
		636, 52,		-- Sprig of Chamomile
		639, 60,		-- Ronfaure Chestnut
		5234, 88,		-- Sprig of Cibol
		628, 102,		-- Stick of Cinnamon
		1633, 582,		-- Handful of Clot Plasma
		4435, 400,		-- Slice of Cockatrice Meat
		4377, 480,		-- Slice of Coeurl Meat
		2271, 158,		-- Bag of Coffee Beans
		2270, 154,		-- Bag of Coffee Cherries
		2273, 154,		-- Bowl of Coffee Powder
		4450, 302,		-- Coral Fungus
		1555, 634,		-- Onz of Coriander
		2215, 40,		-- Bag of Cornstarch
		5233, 680,		-- Cube of Cotton Tofu
		4357, 66,		-- Crawler Egg
		4472, 20,		-- Crayfish
		621, 14,		-- Pot of Crying Mustard
		1475, 488,		-- Onz of Curry Powder
		4375, 1240,		-- Danceshroom
		5566, 130,		-- Date
		4566, 40,		-- Deathball
		4352, 70,		-- Derfland Pear
		4359, 118,		-- Slice of Dhalmel Meat
		4509, 6,		-- Flask of Distilled Water
		5662, 3476,		-- Dragon Fruit
		4272, 550,		-- Slice of Dragon Meat
		622, 24,		-- Pinch of Dried Marjoram
		2645, 72,		-- Eastern Ginger Root
		4388, 22,		-- Eggplant
		5604, 84,		-- Elshimo Pachira Fruit
		5187, 86,		-- Elshimo Coconut
		4363, 22,		-- Faerie Apple
		2110, 560,		-- Jar of Fish Stock
		1522, 2,		-- Sprig of Fresh Marjoram
		4382, 16,		-- Frost Turnip
		4372, 22,		-- Slice of Giant Sheep Meat
		1472, 246,		-- Gardenia Seed
		1111, 290,		-- Block of Gelatin
		617, 62,		-- Ginger Root
		5688, 158,		-- Head of Grauberg Lettuce
		5164, 620,		-- Jar of Ground Wasabi
	}
	
	tpz.shop.general(player, stock)
	
	player:PrintToPlayer(string.format("Jacodaut: Welcome to Caldera's Cooking shop!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- if (csid == 10016 and option == 1) then
        -- player:messageSpecial(ID.text.COOKING_SUPPORT, 0, 8, 1)
        -- player:addStatusEffect(tpz.effect.COOKING_IMAGERY, 1, 0, 120)
    -- end
end