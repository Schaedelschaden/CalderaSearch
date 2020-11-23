-----------------------------------
-- Area: Feretory
--  NPC: Aengus
-- !pos -350 -2 -466 285
-----------------------------------
local ID = require("scripts/zones/Feretory/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
	local itemToAug = 0
	local augments =
	{
	--	{"aug1", "aug1 value", "aug2", "aug2 value", "aug3", "aug3 value", "aug4", "aug4 value"}
		{"1", "4", "23", "1", "25", "1", "31", "1"}, -- HP +5, ACC +2, ATK +2, EVA +2
		{"9", "4", "35", "1", "133", "0", "31", "1"}, -- MP +5, MACC +2, MAB +1, EVA +2
		{"25","4","143","0"}, -- ATK +5, Double Attack +1
	}
	
	-- Checks all 8 slots of the trade window and restricts the augmentable item to ID's between 10249 and 28671 (Armor & Weapons)
	for i = 0, 7, 1 do
		local itemID = trade:getItemId(i)
		printf("Aengus Trade Item %i ID: [%i]", i, itemID)
		if (itemID > 10249 and itemID < 28671 and itemID ~= 14986) then
			itemToAug = itemID
			printf("Aengus Trade Item to Augment ID: [%i]\n", itemToAug)
		end
	end
	
	printf("Aengus Trade Item to Augment ID: [%i]\n", itemToAug)
	
	-- Checks to see if an augmentable item was found
	if (itemToAug < 10249) then
		player:PrintToPlayer(string.format("Aengus : You must include a piece of gear in your trade."),tpz.msg.channel.NS_SAY)
		return
	end
	
	-- Check for required number of Bronze Roses
    if (trade:getItemQty(317) ~= 1) then
        player:PrintToPlayer(string.format("Aengus : You must include a Bronze Rose in your trade."),tpz.msg.channel.NS_SAY)
        return
    end
	
	-- Check for enough inventory space
    if (player:getFreeSlotsCount() < 1) then
        player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, giveToPlayer[1][1])
        return
    end
	
	-- Determine augment set based on additional items in trade
	if (trade:hasItemQty(4358, 12)) then -- 12x Hare Meat
		augmentList = augments[1]
		player:addItem(4358, 12) -- Returns 12x Hare Meat to make testing easier, remove later
	elseif (trade:hasItemQty(936, 12)) then -- 12x Rock Salt
		augmentList = augments[2]
		player:addItem(936, 12) -- Returns 12x Rock Salt to make testing easier, remove later
	elseif (trade:hasItemQty(14986, 1)) then -- 1x Ochimusha Kote
		augmentList = augments[3]
	elseif not (trade:hasItemQty(936, 12) or trade:hasItemQty(4358, 12) or trade:hasItemQty(14986, 1)) then
		player:PrintToPlayer(string.format("Aengus : You must include 12x Hare Meat, 12x Rock Salt, or a pair of Ochimusha Kote."),tpz.msg.channel.NS_SAY)
        return
	end
	
--	player:PrintToPlayer(string.format("Aengus : Applying augment %i %i %i %i %i %i %i %i!", augmentList[1], augmentList[2], augmentList[3], augmentList[4], augmentList[5], augmentList[6], augmentList[7], augmentList[8]),tpz.msg.channel.NS_SAY)
	
	-- Make the trade	
    player:tradeComplete()
	
	player:addItem(itemToAug, 1, augmentList[1], augmentList[2], augmentList[3], augmentList[4], augmentList[5], augmentList[6], augmentList[7], augmentList[8])
	player:addItem(317, 1) -- Returns a Bronze Rose to make testing easier, remove later
	
	if (itemToAug ~= 0) then
		player:PrintToPlayer(string.format("Aengus : Here you go! All augmented!"),tpz.msg.channel.NS_SAY)
		player:messageSpecial(ID.text.ITEM_OBTAINED, itemToAug)
	end
end

function onTrigger(player,npc)
--	player:PrintToPlayer(string.format("Aengus : I handle the augment trades requiring a Bronze Rose."),tpz.msg.channel.NS_SAY);
--	player:PrintToPlayer(string.format("Aengus : Trade me EXACTLY the ingredients requested. Any additional items included will be lost in the trade."),tpz.msg.channel.NS_SAY);
	player:PrintToPlayer(string.format("Aengus : Select an augment set from the list below:"),tpz.msg.channel.NS_SAY);
	player:PrintToPlayer(string.format("Aengus : 12x Hare Meat = HP +5, ACC +2, ATK +2, EVA +2"),tpz.msg.channel.NS_SAY);
	player:PrintToPlayer(string.format("Aengus : 12x Rock Salt = MP +5, MACC +2, MAB +1, EVA +2"),tpz.msg.channel.NS_SAY);
	player:PrintToPlayer(string.format("Aengus : 1x Ochimusha Kote = ATK +5, Double Attack +1"),tpz.msg.channel.NS_SAY);
	player:PrintToPlayer(string.format("Aengus : Trade me 1 piece of gear, 1 Bronze Rose (furniture), and the item/stack from above."),tpz.msg.channel.NS_SAY);
	-- player:PrintToPlayer(string.format("Aengus : 1x Four-Leaf Mandragora Bud =     12x Rabbit Hide = +5 HP    12x Flint Stone = +5 DEF"),tpz.msg.channel.NS_SAY);
end

function onEventUpdate(player,csid,option)
	
end

function onEventFinish(player,csid,option)
	
end