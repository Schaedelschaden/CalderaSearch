-----------------------------------
-- Area: Feretory
--  NPC: Teyrnon
-- !pos -353.9244 -3.2226 -469.9172 285
-----------------------------------
local ID = require("scripts/zones/Feretory/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
	local itemToAug = 0
	local itemFound = false
	local augments =
	{
	--	{"aug1", "aug1 value", "aug2", "aug2 value", "aug3", "aug3 value", "aug4", "aug4 value"}
		{"514", "0", "33", "2", "42", "0", "39", "0"}, -- VIT +1, DEF +3, Enemy Crit Hit Rate -1%, Enmity +1
		{"1", "6", "512", "0", "23", "2", "25", "2"}, -- HP +7, STR +1, ACC +3, ATK +3
		{"9", "6", "517", "0", "329", "0", "31", "2"}, -- MP +7, MND +1, Cure Potency +1%, EVA +3
		{"9", "6", "516", "0", "133", "2", "31", "2"}, -- MP +7, INT +1, MAB +3, EVA +3
		{"97", "2", "99", "2", "98", "2"}, -- Pet: ATK/RATK +3, Pet: DEF +3, Pet: EVA +3
	}
	
	-- Checks all 8 slots of the trade window and restricts the augmentable item to ID's between 10249 and 28671 (Armor & Weapons)
	for i = 0, 7, 1 do
		local itemID = trade:getItemId(i)
--		printf("Teyrnon Trade Item %i ID: [%i]", i, itemID)
		if (itemID > 10249 and itemID < 28671 and itemFound == false) then
			itemToAug = itemID
			itemFound = true
--			printf("Teyrnon Trade Item to Augment ID: [%i]\n", itemToAug)
			if (trade:getItem(i):getReqLvl() < 31 or trade:getItem(i):getReqLvl() > 60) then
				player:PrintToPlayer(string.format("Teyrnon : The item to be augmented must be between levels 31 and 60."),tpz.msg.channel.NS_SAY)
				return
			end
		end
	end
	
--	printf("Teyrnon Trade Item to Augment ID: [%i]\n", itemToAug)
	
	-- Checks to see if an augmentable item was found
	if (itemToAug < 10249) then
		player:PrintToPlayer(string.format("Teyrnon : You must include a piece of gear in your trade."),tpz.msg.channel.NS_SAY)
		return
	end
	
	-- Check for required number of Crystal Roses
    if (trade:getItemQty(318) ~= 1) then
        player:PrintToPlayer(string.format("Teyrnon : You must include a Crystal Rose in your trade."),tpz.msg.channel.NS_SAY)
        return
    end
	
	-- Check for enough inventory space
    if (player:getFreeSlotsCount() < 1) then
        player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, giveToPlayer[1][1])
        return
    end
	
	-- Determine augment set based on additional items in trade
	if (trade:hasItemQty(4400, 12)) then -- 12x Land Crab Meat
		augmentList = augments[1]
--		player:addItem(4400, 12) -- Returns 12x Land Crab Meat to make testing easier, remove later
	elseif (trade:hasItemQty(894, 12)) then -- 12x Beetle Jaw
		augmentList = augments[2]
--		player:addItem(894, 12) -- Returns 12x Beetle Jaw to make testing easier, remove later
	elseif (trade:hasItemQty(918, 12)) then -- 12x Mistletoe
		augmentList = augments[3]
--		player:addItem(918, 12) -- Returns 12x Mistletoe to make testing easier, remove later
	elseif (trade:hasItemQty(2506, 12)) then -- 12x Ladybug Wing
		augmentList = augments[4]
--		player:addItem(2506, 12) -- Returns 12x Ladybug Wing to make testing easier, remove later
	elseif (trade:hasItemQty(924, 12)) then -- 12x Fiend Blood
		augmentList = augments[5]
--		player:addItem(924, 12) -- Returns 12x Fiend Blood to make testing easier, remove later
	elseif not (trade:hasItemQty(4400, 12) or trade:hasItemQty(894, 12) or trade:hasItemQty(918, 12) or trade:hasItemQty(2506, 12) or trade:hasItemQty(924, 12)) then
		player:PrintToPlayer(string.format("Teyrnon : You must include 12x Land Crab Meat, 12x Beetle Jaws, 12x Mistletoe, 12x Ladybug Wings, or 12x Fiend Blood."),tpz.msg.channel.NS_SAY)
        return
	end
	
--	player:PrintToPlayer(string.format("Teyrnon : Applying augment %i %i %i %i %i %i %i %i!", augmentList[1], augmentList[2], augmentList[3], augmentList[4], augmentList[5], augmentList[6], augmentList[7], augmentList[8]),tpz.msg.channel.NS_SAY)
	
	-- Make the trade	
    player:tradeComplete()
	
	player:addItem(itemToAug, 1, augmentList[1], augmentList[2], augmentList[3], augmentList[4], augmentList[5], augmentList[6], augmentList[7], augmentList[8])
--	player:addItem(318, 1) -- Returns a Crystal Rose to make testing easier, remove later
	
	if (itemToAug ~= 0) then
		player:PrintToPlayer(string.format("Teyrnon : Here you go! All augmented!"),tpz.msg.channel.NS_SAY)
		player:messageSpecial(ID.text.ITEM_OBTAINED, itemToAug)
	end
end

function onTrigger(player,npc)
	player:PrintToPlayer(string.format("Teyrnon : Select an augment set from the list below:"),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Teyrnon : 12x Land Crab Meat = VIT +1, DEF +3, Enemy Crit Hit Rate -1%%, Enmity +1"),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Teyrnon : 12x Beetle Jaws = HP +7, STR +1, ACC +3, ATK +3"),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Teyrnon : 12x Mistletoe = MP +7, MND +1, Cure Potency +1%%, EVA +3"),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Teyrnon : 12x Ladybug Wings = MP +7, INT +1, MAB +3, EVA +3"),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Teyrnon : 12x Fiend Blood = Pet: ATK/RATK +3, Pet: DEF +3, Pet: EVA +3"),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Teyrnon : Trade 1 piece of level 31-60 gear, 1 Crystal Rose (furniture), and the item/stack from above."),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Teyrnon : Trade me EXACTLY the ingredients requested. Any additional items included will be lost in the trade."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player,csid,option)
	
end

function onEventFinish(player,csid,option)
	
end