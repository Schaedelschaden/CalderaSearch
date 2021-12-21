-----------------------------------
-- Area: Feretory
--  NPC: Maccus
-- !pos -361.9353 -3.0991 -469.9604 285
-----------------------------------
local ID = require("scripts/zones/Feretory/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
	-- local itemToAug = 0
	-- local itemFound = false
	-- local augments =
	-- {
	-- --	{"aug1", "aug1 value", "aug2", "aug2 value", "aug3", "aug3 value", "aug4", "aug4 value"}
		-- {"514", "2", "33", "4", "42", "1", "39", "1"}, -- VIT +3, DEF +5, Enemy Crit Hit Rate -2%, Enmity +2
		-- {"1", "9", "512", "2", "23", "4", "25", "4"}, -- HP +10, STR +3, ACC +5, ATK +5
		-- {"9", "9", "517", "2", "329", "1", "31", "4"}, -- MP +10, MND +3, Cure Potency +2%, EVA +5
		-- {"9", "9", "516", "2", "133", "4", "31", "4"}, -- MP +10, INT +3, MAB +5, EVA +5
		-- {"97", "4", "99", "4", "98", "4"}, -- Pet: ATK/RATK +5, Pet: DEF +5, Pet: EVA +5
	-- }
	
	-- -- Checks all 8 slots of the trade window and restricts the augmentable item to ID's between 10249 and 28671 (Armor & Weapons)
	-- for i = 0, 7, 1 do
		-- local itemID = trade:getItemId(i)
-- --		printf("Maccus Trade Item %i ID: [%i]", i, itemID)
		-- if (itemID > 10249 and itemID < 28671 and itemFound == false) then
			-- itemToAug = itemID
			-- itemFound = true
-- --			printf("Maccus Trade Item to Augment ID: [%i]\n", itemToAug)
			-- if (trade:getItem(i):getReqLvl() < 61 or trade:getItem(i):getReqLvl() > 90) then
				-- player:PrintToPlayer(string.format("Maccus : The item to be augmented must be between levels 61 and 90."),tpz.msg.channel.NS_SAY)
				-- return
			-- end
		-- end
	-- end
	
-- --	printf("Maccus Trade Item to Augment ID: [%i]\n", itemToAug)
	
	-- -- Checks to see if an augmentable item was found
	-- if (itemToAug < 10249) then
		-- player:PrintToPlayer(string.format("Maccus : You must include a piece of gear in your trade."),tpz.msg.channel.NS_SAY)
		-- return
	-- end
	
	-- -- Check for required number of Star Globes
    -- if (trade:getItemQty(139) ~= 1) then
        -- player:PrintToPlayer(string.format("Maccus : You must include a Star Globe in your trade."),tpz.msg.channel.NS_SAY)
        -- return
    -- end
	
	-- -- Check for enough inventory space
    -- if (player:getFreeSlotsCount() < 1) then
        -- player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, giveToPlayer[1][1])
        -- return
    -- end
	
	-- -- Determine augment set based on additional items in trade
	-- if (trade:hasItemQty(510, 12)) then -- 12x Goblin Armor
		-- augmentList = augments[1]
-- --		player:addItem(510, 12) -- Returns 12x Goblin Armor to make testing easier, remove later
	-- elseif (trade:hasItemQty(1624, 12)) then -- 12x Bugbear Mask
		-- augmentList = augments[2]
-- --		player:addItem(1624, 12) -- Returns 12x Bugbear Masks to make testing easier, remove later
	-- elseif (trade:hasItemQty(1119, 12)) then -- 12x Tonberry Coat
		-- augmentList = augments[3]
-- --		player:addItem(1119, 12) -- Returns 12x Tonberry Coat to make testing easier, remove later
	-- elseif (trade:hasItemQty(1121, 12)) then -- 12x Antican Robe
		-- augmentList = augments[4]
-- --		player:addItem(1121, 12) -- Returns 12x Antican Robe to make testing easier, remove later
	-- elseif (trade:hasItemQty(499, 12)) then -- 12x Gigas Necklace
		-- augmentList = augments[5]
-- --		player:addItem(499, 12) -- Returns 12x Gigas Necklace to make testing easier, remove later
	-- elseif not (trade:hasItemQty(510, 12) or trade:hasItemQty(1624, 12) or trade:hasItemQty(1119, 12) or trade:hasItemQty(1121, 12) or trade:hasItemQty(499, 12)) then
		-- player:PrintToPlayer(string.format("Maccus : You must include 12x Goblin Armor, 12x Bugbear Masks, 12x Tonberry Coats, 12x Antican Robes, or 12x Gigas Necklace."),tpz.msg.channel.NS_SAY)
        -- return
	-- end
	
-- --	player:PrintToPlayer(string.format("Maccus : Applying augment %i %i %i %i %i %i %i %i!", augmentList[1], augmentList[2], augmentList[3], augmentList[4], augmentList[5], augmentList[6], augmentList[7], augmentList[8]),tpz.msg.channel.NS_SAY)
	
	-- -- Make the trade	
    -- player:tradeComplete()
	
	-- player:addItem(itemToAug, 1, augmentList[1], augmentList[2], augmentList[3], augmentList[4], augmentList[5], augmentList[6], augmentList[7], augmentList[8])
-- --	player:addItem(139, 1) -- Returns a Star Globe to make testing easier, remove later
	
	-- if (itemToAug ~= 0) then
		-- player:PrintToPlayer(string.format("Maccus : Here you go! All augmented!"),tpz.msg.channel.NS_SAY)
		-- player:messageSpecial(ID.text.ITEM_OBTAINED, itemToAug)
	-- end
end

function onTrigger(player,npc)
	-- player:PrintToPlayer(string.format("Maccus : Select an augment set from the list below:"),tpz.msg.channel.NS_SAY)
	-- player:PrintToPlayer(string.format("Maccus : 12x Goblin Armor = VIT +3, DEF +5, Enemy Crit Hit Rate -2%%, Enmity +2"),tpz.msg.channel.NS_SAY)
	-- player:PrintToPlayer(string.format("Maccus : 12x Bugbear Masks = HP +10, STR +3, ACC +5, ATK +5"),tpz.msg.channel.NS_SAY)
	-- player:PrintToPlayer(string.format("Maccus : 12x Tonberry Coats = MP +10, MND +3, Cure Potency +2%%, EVA +5"),tpz.msg.channel.NS_SAY)
	-- player:PrintToPlayer(string.format("Maccus : 12x Antican Robe = MP +10, INT +3, MAB +5, EVA +5"),tpz.msg.channel.NS_SAY)
	-- player:PrintToPlayer(string.format("Maccus : 12x Gigas Necklace = Pet: ATK/RATK +5, Pet: DEF +5, Pet: EVA +5"),tpz.msg.channel.NS_SAY)
	-- player:PrintToPlayer(string.format("Maccus : Trade 1 piece of level 61-90 gear, 1 Star Globe (furniture), and the item/stack from above."),tpz.msg.channel.NS_SAY)
	-- player:PrintToPlayer(string.format("Maccus : Trade me EXACTLY the ingredients requested. Any additional items included will be lost in the trade."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player,csid,option)
	
end

function onEventFinish(player,csid,option)
	
end