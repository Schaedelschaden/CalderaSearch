-----------------------------------
-- Area: Western Adoulin
--  NPC: Rienne
-- Type: Snow/Leaf/Dusk Stone Conversion
-- !pos 91.594 -0.15 -53.352 256
-----------------------------------
local ID = require("scripts/zones/Western_Adoulin/IDs")
require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

local acceptedStones = {
						-- Snowslit, Snowtip, Snowdim, Snoworb
						8930, 8939, 8948, 8957,
						-- Leafslit, Leaftip, Leafdim, Leaforb
						8933, 8942, 8951, 8960,
						-- Duskslit, Dusktip, Duskdim, Duskorb 
						8936, 8945, 8954, 8963,
						-- Snowslit +1, Snowtip +1, Snowdim +1, Snoworb +1 
						8931, 8940, 8949, 8958,
						-- Leafslit +1, Leaftip +1, Leafdim +1, Leaforb +1 
						8934, 8943, 8952, 8961,
						-- Duskslit +1, Dusktip +1, Duskdim +1, Duskorb +1 
						8937, 8946, 8955, 8964,
					   }
					   
local stoneTypes = {"Snowslit", "Snowtip", "Snowdim", "Snoworb", "Leafslit", "Leaftip", "Leafdim", "Leaforb", "Duskslit", "Dusktip", "Duskdim", "Duskorb"}

function onTrade(player, npc, trade)
	if (player:getCharVar("KillCounter_Kirin") > 0 and player:getCharVar("KillCounter_JailOfLove") > 0) then
		local stoneID
		local stoneQty
		local foundType
		local upgradedStones
		
		for i = 1, #acceptedStones do
			stoneQty = trade:getItemQty(acceptedStones[i])
			
			if (stoneQty > 0) then
				stoneID = acceptedStones[i]
				foundType = i
				break
			end
		end
		
		if (stoneQty == 0 or stoneQty == nil) then
			player:PrintToPlayer(string.format("Rienne : I'm sure that might be valuable, but I only handle Snow, Leaf, and Dusk stones."),tpz.msg.channel.NS_SAY)
		elseif (foundType >= 1 and foundType <= 12 and stoneQty % 33 == 0) then
			upgradedStones = stoneQty / 33
			
			if (upgradedStones > 1) then
				player:PrintToPlayer(string.format("Rienne : I'll take these %i NQ %s stones and give you %i HQ+1 stones.", stoneQty, stoneTypes[foundType], upgradedStones),tpz.msg.channel.NS_SAY)
			else
				player:PrintToPlayer(string.format("Rienne : I'll take these %i NQ %s stones and give you %i HQ+1 stone.", stoneQty, stoneTypes[foundType], upgradedStones),tpz.msg.channel.NS_SAY)
			end
		elseif (foundType >= 13 and foundType <= 24 and stoneQty % 3 == 0) then
			upgradedStones = stoneQty / 3
			
			if (upgradedStones > 1) then
				player:PrintToPlayer(string.format("Rienne : I'll take these %i HQ+1 %s stones and give you %i HQ+2 stones.", stoneQty, stoneTypes[foundType - 12], upgradedStones),tpz.msg.channel.NS_SAY)
			else
				player:PrintToPlayer(string.format("Rienne : I'll take these %i HQ+1 %s stones and give you %i HQ+2 stone.", stoneQty, stoneTypes[foundType - 12], upgradedStones),tpz.msg.channel.NS_SAY)
			end
		else
			player:PrintToPlayer(string.format("Rienne : Sorry, I need more stones to properly distill enough energy for a more potent kind."),tpz.msg.channel.NS_SAY)
			return
		end
		
		local trades = {{{stoneID, stoneQty}}}
		
		if npcUtil.tradeHasExactly(trade, trades[1]) then
			player:addItem(stoneID + 1, upgradedStones)
			player:messageSpecial(ID.text.ITEM_OBTAINED, stoneID + 1)
			player:tradeComplete(trade)
			player:PrintToPlayer(string.format("Rienne : Here you go! Some upgraded stones for your efforts."),tpz.msg.channel.NS_SAY)
		else
			player:PrintToPlayer(string.format("Rienne : Looks like you're trying to give me something that I can't accept."),tpz.msg.channel.NS_SAY)
			return
		end
	else
		player:PrintToPlayer(string.format("Rienne : Looks like you'll need to defeat Kirin and the Jailer of Love before I can make trades with you."),tpz.msg.channel.NS_SAY)
	end
end

function onTrigger(player, npc)
	if (player:getCharVar("KillCounter_Kirin") > 0 and player:getCharVar("KillCounter_JailOfLove") > 0) then
		player:PrintToPlayer(string.format("Rienne : I accept Snow, Leaf, and Dusk stones and will distill their energy into more potent forms."),tpz.msg.channel.NS_SAY)
		player:PrintToPlayer(string.format("Rienne : Trade me 33 NQ stones to receive 1 HQ+1 stone of the same type."),tpz.msg.channel.NS_SAY)
		player:PrintToPlayer(string.format("Rienne : Trade me 3 HQ+1 stones to receive 1 HQ+2 stone of the same type."),tpz.msg.channel.NS_SAY)
		player:PrintToPlayer(string.format("Rienne : You can trade me large quantities of stones as long as they're a multiple of 33 for NQ or 3 for HQ+1."),tpz.msg.channel.NS_SAY)
	else
		player:PrintToPlayer(string.format("Rienne : Looks like you'll need to defeat Kirin and the Jailer of Love before I can make trades with you."),tpz.msg.channel.NS_SAY)
	end
end

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
	
end