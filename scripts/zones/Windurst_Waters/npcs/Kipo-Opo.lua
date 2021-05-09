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
		638, 82,		-- Sprig of Sage
		5299, 74,		-- Dish of Salsa
		4389, 16,		-- San d'Orian Carrot
		610, 30,		-- Bag of San d'Orian Flour
		4431, 38,		-- Bunch of San d'Orian Grapes
		4392, 16,		-- Saruta Orange
		4447, 406,		-- Scream Fungus
		615, 44,		-- Stick of Selbina Butter
		4378, 30,		-- Jug of Selbina Milk
		1840, 900,		-- Bag of Semolina
		5237, 176,		-- Bundle of Shirataki
		5236, 766,		-- Clump of Shungiku
		2236, 154,		-- Bag of Simsim
		1981, 194,		-- Skull Locust
		4374, 50,		-- Sleepshroom
		5668, 640,		-- Smilodon Liver
		1984, 804,		-- Snapping Mole
		2710, 388,		-- Bundle of Soba Noodles
		4565, 30,		-- Sobbing Fungus
		5232, 60,		-- Jug of Soy Milk
		2111, 80,		-- Saucer of Soy Stock
		1776, 400,		-- Serving of Spaghetti
		1471, 380,		-- Box of Sticky Rice
		4460, 138,		-- Block of Stone Cheese
		4505, 48,		-- Handful of Sunflower Seeds
		620, 30,		-- Box of Tarutaru Rice
		4412, 184,		-- Thundermelon
		1554, 280,		-- Onz of Turmeric
		5703, 166,		-- Jug of Uleguerand Milk
		2112, 142,		-- Stick of Vanilla
		5661, 624,		-- Walnut
		4602, 1020,		-- Warm Egg
		4491, 100,		-- Watermelon
		5562, 60,		-- Pot of White Honey
		4597, 40,		-- Wild Melon
		4387, 144,		-- Wild Onion
		4596, 30,		-- Bunch of Wild Pamamas
		4598, 22,		-- Wild Pineapple
		635, 8,			-- Clump of Windurstian Tea Leaves
		5907, 200,		-- Winterflower
		4373, 430,		-- Woozyshroom
		4445, 22,		-- Yagudo Cherry
		5575, 408,		-- Bowl of Yogurt
		5581, 400,		-- Slice of Ziz Meat
		5726, 252,		-- Zucchini
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