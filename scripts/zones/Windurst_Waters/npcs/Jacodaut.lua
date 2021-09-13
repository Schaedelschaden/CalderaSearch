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
		4504, 6, 		-- Acorn
		5680, 3711, 	-- Agaricus Mushroom
		5649, 141, 		-- Handful of Roasted Almonds
		5568, 762,		-- Apkallu Egg
		1523, 237,		-- Sprig of Apple Mint
		625, 66,		-- Bottle of Apple Vinegar
		8800, 120,		-- Azuki Bean
		9201, 900,		-- Handful of Bamboo Shoots
		623, 623,		-- Handful of Bay Leaves
		4571, 75,		-- Clump of Beaugreens
		4570, 42,		-- Bird Egg
		626, 153,		-- Pinch of Black Pepper
		1102, 75,		-- Bunch of Blazing Peppers
		618, 21,		-- Pod of Blue Peas
		4503, 114,		-- Bunch of Buburimu Grapes
		2702, 1224,		-- Bag of Buckwheat Flour
		5152, 960,		-- Slice of Buffalo Meat
		5651, 2244,		-- Burdock Root
		5908, 200,		-- Butterpear
		5565, 18000,	-- Slice of Cerberus Meat
		5684, 585,		-- Wedge of Chalaimbille
		636, 78,		-- Sprig of Chamomile
		639, 90,		-- Ronfaure Chestnut
		5234, 132,		-- Sprig of Cibol
		628, 153,		-- Stick of Cinnamon
		1633, 900,		-- Handful of Clot Plasma
		4435, 600,		-- Slice of Cockatrice Meat
		4377, 720,		-- Slice of Coeurl Meat
		2271, 237,		-- Bag of Coffee Beans
		2270, 231,		-- Bag of Coffee Cherries
		2273, 231,		-- Bowl of Coffee Powder
		4450, 453,		-- Coral Fungus
		1555, 951,		-- Onz of Coriander
		2215, 60,		-- Bag of Cornstarch
		5233, 1020,		-- Cube of Cotton Tofu
		4357, 99,		-- Crawler Egg
		4472, 30,		-- Crayfish
		621, 21,		-- Pot of Crying Mustard
		1475, 732,		-- Onz of Curry Powder
		4375, 1860,		-- Danceshroom
		5566, 195,		-- Date
		4566, 60,		-- Deathball
		4352, 105,		-- Derfland Pear
		4359, 177,		-- Slice of Dhalmel Meat
		4509, 9,		-- Flask of Distilled Water
		5662, 5214,		-- Dragon Fruit
		4272, 18000,	-- Slice of Dragon Meat
		622, 36,		-- Pinch of Dried Marjoram
		2645, 108,		-- Eastern Ginger Root
		4388, 33,		-- Eggplant
		5604, 126,		-- Elshimo Pachira Fruit
		5187, 129,		-- Elshimo Coconut
		4363, 33,		-- Faerie Apple
		5964, 2700,		-- Felicifruit
		2110, 840,		-- Jar of Fish Stock
		1522, 3,		-- Sprig of Fresh Marjoram
		4382, 24,		-- Frost Turnip
		4372, 33,		-- Slice of Giant Sheep Meat
		1472, 369,		-- Gardenia Seed
		1111, 435,		-- Block of Gelatin
		617, 93,		-- Ginger Root
		5688, 237,		-- Head of Grauberg Lettuce
		5164, 1557,		-- Jar of Ground Wasabi
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