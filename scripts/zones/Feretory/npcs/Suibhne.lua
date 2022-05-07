-----------------------------------
-- Area: Feretory
--  NPC: Suibhne
-- !pos -353.9244 -3.2226 -469.9172 285
-----------------------------------
local ID = require("scripts/zones/Feretory/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)
	local itemToAug = 0
	local itemFound = false
	local augments =
	{
	--	{"aug1", "aug1 value", "aug2", "aug2 value", "aug3", "aug3 value", "aug4", "aug4 value"}
		{"1", "14", "31", "9", "42", "1", "54", "1"}, 	-- HP +15, EVA +10, Enemy Crit Hit Rate -2%, PDT -2%
		{"41", "1", "328", "1", "129", "9", "195", "2"}, -- Crit Hit Rate +2%, Crit Hit Damage +2%, ACC/RACC +10, Subtle Blow +3
		{"9", "14", "516", "2", "362", "9", "35", "9"}, -- MP +15, INT +3, Magic Damage +10, MACC +10
		{"1806", "4", "102", "1", "115", "2"}, 			-- Pet: STR/DEX/VIT +5, Pet: Crit Hit Rate +2%, Pet: Store TP +3
	}
	
	-- Checks all 8 slots of the trade window and restricts the augmentable item to ID's between 10249 and 28671 (Armor & Weapons)
	for i = 0, 7, 1 do
		local itemID = trade:getItemId(i)
		local ilvl = npc:getGearILvl(itemID)
--		printf("Suibhne Trade Item %i ID: [%i]", i, itemID)
		if (itemID > 10249 and itemID < 28671 and itemFound == false) then
			itemToAug = itemID
			itemFound = true
--			printf("Suibhne Trade Item to Augment ID: [%i]\n", itemToAug)
			if (trade:getItem(i):getReqLvl() < 91 or ilvl > 113) then
				player:PrintToPlayer(string.format("Suibhne : The item to be augmented must be between level 90 and item level 113."),tpz.msg.channel.NS_SAY)
				return
			end
			
			local itemGearSlot = player:getGearSlot(itemID)
			
			-- Check if the traded gear is a Head, Body, Hand, Leg, or Feet piece
			if (itemGearSlot ~= 4 and itemGearSlot ~= 5 and itemGearSlot ~= 6 and itemGearSlot ~= 7 and itemGearSlot ~= 8) then
				player:PrintToPlayer(string.format("Suibhne : The item to be augmented must be a Head, Body, Hands, Leg, or Feet piece."),tpz.msg.channel.NS_SAY)
				return
			end
		end
	end
	
--	printf("Suibhne Trade Item to Augment ID: [%i]\n", itemToAug)
	
	-- Checks to see if an augmentable item was found
	if (itemToAug < 10249) then
		player:PrintToPlayer(string.format("Suibhne : You must include a piece of gear in your trade."),tpz.msg.channel.NS_SAY)
		return
	end
	
	-- Check for required number of Mythril Bell
    if (trade:getItemQty(321) ~= 1) then
        player:PrintToPlayer(string.format("Suibhne : You must include a Mythril Bell in your trade."),tpz.msg.channel.NS_SAY)
        return
    end
	
	-- Check for enough inventory space
    if (player:getFreeSlotsCount() < 1) then
        player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, giveToPlayer[1][1])
        return
    end
	
	-- Determine augment set based on additional items in trade
	if (trade:hasItemQty(3275, 4)) then -- 4x Genbu Scrap
		augmentList = augments[1]
		player:setCharVar("[Aug]SuibhnePathGenbu_"..itemToAug, 1)
		-- player:addItem(3275, 4) -- Returns 4x Genbu Scrap to make testing easier, remove later
	elseif (trade:hasItemQty(3276, 4)) then -- 4x Suzaku Scrap
		augmentList = augments[3]
		player:setCharVar("[Aug]SuibhnePathSuzaku_"..itemToAug, 1)
		-- player:addItem(3276, 4) -- Returns 4x Suzaku Scrap to make testing easier, remove later
	elseif (trade:hasItemQty(3277, 4)) then -- 4x Seiryu Scrap
		augmentList = augments[4]
		player:setCharVar("[Aug]SuibhnePathSeiryu_"..itemToAug, 1)
		-- player:addItem(3277, 4) -- Returns 4x Seiryu Scrap to make testing easier, remove later
	elseif (trade:hasItemQty(3278, 4)) then -- 4x Byakko Scrap
		augmentList = augments[2]
		player:setCharVar("[Aug]SuibhnePathByakko_"..itemToAug, 1)
		-- player:addItem(3278, 4) -- Returns 4x Byakko Scrap to make testing easier, remove later
	elseif not (trade:hasItemQty(3275, 4) or trade:hasItemQty(3276, 4) or trade:hasItemQty(3277, 4) or trade:hasItemQty(3278, 4)) then
		player:PrintToPlayer(string.format("Suibhne : You must include 4x Byakko Scraps, 4x Genbu Scraps, 4x Seiryu Scraps, or 4x Suzaku Scraps."),tpz.msg.channel.NS_SAY)
        return
	end
	
--	player:PrintToPlayer(string.format("Suibhne : Applying augment %i %i %i %i %i %i %i %i!", augmentList[1], augmentList[2], augmentList[3], augmentList[4], augmentList[5], augmentList[6], augmentList[7], augmentList[8]),tpz.msg.channel.NS_SAY)
	
	-- Make the trade	
    player:tradeComplete()
	
	player:addItem(itemToAug, 1, augmentList[1], augmentList[2], augmentList[3], augmentList[4], augmentList[5], augmentList[6], augmentList[7], augmentList[8])
	-- player:addItem(321, 1) -- Returns a Mythril Bell to make testing easier, remove later
	
	if (itemToAug ~= 0) then
		player:PrintToPlayer(string.format("Suibhne : Here you go! All augmented!"),tpz.msg.channel.NS_SAY)
		player:messageSpecial(ID.text.ITEM_OBTAINED, itemToAug)
	end
end

function onTrigger(player,npc)
	player:PrintToPlayer(string.format("Suibhne : Select an augment set from the list below:"),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Suibhne : 4x Genbu Scraps = HP +15, EVA +10, Enemy Crit Hit Rate -2%%, PDT -2%%"),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Suibhne : 4x Byakko Scraps = Crit Hit Rate +2%%, Crit Hit Damage +2%%, ACC/RACC +10, Subtle Blow +3"),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Suibhne : 4x Suzaku Scraps = MP +15, INT +3, Magic Damage +10, MACC +10"),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Suibhne : 4x Seiryu Scraps = Pet: STR/DEX/VIT +5, Pet: Crit Hit Rate +2%%, Pet: Store TP +3"),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Suibhne : Trade 1 piece of level 90-113 Head/Body/Hands/Leg/Feet gear, 1 Mythril Bell (furniture), and the items from above."),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Suibhne : Trade me EXACTLY the ingredients requested. Any additional items included will be lost in the trade."),tpz.msg.channel.NS_SAY)
--	player:PrintToPlayer(string.format("Suibhne : I handle the augments for gear between levels 91 and 109! Please bear with me while I am being built."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player,csid,option)
	
end

function onEventFinish(player,csid,option)
	
end