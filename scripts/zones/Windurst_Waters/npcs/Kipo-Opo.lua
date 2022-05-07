-----------------------------------
-- Area: Windurst Waters
--  NPC: Kipo-Opo
-- Type: Cooking Adv. Image Support
-- !pos -119.750 -5.239 64.500 238
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/crafting")
local ID = require("scripts/zones/Windurst_Waters/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    -- local guildMember = isGuildMember(player, 4)
    -- local SkillLevel = player:getSkillLevel(tpz.skill.COOKING)
    -- local Cost = getAdvImageSupportCost(player, tpz.skill.COOKING)

    -- if (guildMember == 1) then
        -- if (player:hasStatusEffect(tpz.effect.COOKING_IMAGERY) == false) then
            -- player:startEvent(10015, Cost, SkillLevel, 0, 495, player:getGil(), 0, 0, 0) -- p1 = skill level
        -- else
            -- player:startEvent(10015, Cost, SkillLevel, 0, 495, player:getGil(), 28589, 0, 0)
        -- end
    -- else
        -- player:startEvent(10015) -- Standard Dialogue
    -- end
	
	local stock =
    {
		638, 111,		-- Sprig of Sage
		5299, 111,		-- Dish of Salsa
		9199, 7400,		-- Bowl of Salt-based Ramen Soup
		4389, 24,		-- San d'Orian Carrot
		610, 45,		-- Bag of San d'Orian Flour
		4431, 57,		-- Bunch of San d'Orian Grapes
		4392, 24,		-- Saruta Orange
		4447, 609,		-- Scream Fungus
		615, 45,		-- Stick of Selbina Butter
		4378, 45,		-- Jug of Selbina Milk
		1840, 1200,		-- Bag of Semolina
		5237, 264,		-- Bundle of Shirataki
		5236, 1149,		-- Clump of Shungiku
		2236, 231,		-- Bag of Simsim
		1981, 291,		-- Skull Locust
		4374, 75,		-- Sleepshroom
		5668, 960,		-- Smilodon Liver
		1984, 123,		-- Snapping Mole
		2710, 582,		-- Bundle of Soba Noodles
		4565, 45,		-- Sobbing Fungus
		5232, 90,		-- Jug of Soy Milk
		9197, 7400,		-- Bowl of Soy-based Ramen Soup
		2111, 120,		-- Saucer of Soy Stock
		1776, 900,		-- Serving of Spaghetti
		1471, 570,		-- Box of Sticky Rice
		4460, 207,		-- Block of Stone Cheese
		4505, 72,		-- Handful of Sunflower Seeds
		620, 45,		-- Box of Tarutaru Rice
		4412, 276,		-- Thundermelon
		1554, 420,		-- Onz of Turmeric
		5703, 246,		-- Jug of Uleguerand Milk
		2112, 213,		-- Stick of Vanilla
		5661, 936,		-- Walnut
		4602, 1500,		-- Warm Egg
		4491, 150,		-- Watermelon
		5562, 90,		-- Pot of White Honey
		4597, 60,		-- Wild Melon
		4387, 234,		-- Wild Onion
		4596, 45,		-- Bunch of Wild Pamamas
		4598, 33,		-- Wild Pineapple
		635, 12,			-- Clump of Windurstian Tea Leaves
		5907, 200,		-- Winterflower
		4373, 645,		-- Woozyshroom
		4445, 33,		-- Yagudo Cherry
		5575, 612,		-- Bowl of Yogurt
		5581, 600,		-- Slice of Ziz Meat
		5726, 378,		-- Zucchini
	}
	
	tpz.shop.general(player, stock)
	
	player:PrintToPlayer(string.format("Kipo-Opo: Welcome to Caldera's Cooking shop!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- local Cost = getAdvImageSupportCost(player, tpz.skill.COOKING)

    -- if (csid == 10015 and option == 1) then
        -- player:delGil(Cost)
        -- player:messageSpecial(ID.text.COOKING_SUPPORT, 0, 8, 0)
        -- player:addStatusEffect(tpz.effect.COOKING_IMAGERY, 3, 0, 480)
    -- end
end