-----------------------------------
-- Area: Eastern Adoulin (257)
--  NPC: Sifa Alani
-- Type: Ambuscade Equipment
-- !pos -103 -0.6 -50 257
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------


-----------------------------------
-- Ambuscade Weapons
-----------------------------------
local itemTrades =
{
	[  1] = {trade = {21515, {9782, 15}}, reward = 21516}, -- Tokko Knuckles to Ajja Knucles
    [  2] = {trade = {21561, {9782, 15}}, reward = 21562}, -- Tokko Knife    to Ajja Knife
    [  3] = {trade = {21617, {9782, 15}}, reward = 21618}, -- Tokko Sword    to Ajja Sword
    [  4] = {trade = {21670, {9782, 15}}, reward = 21671}, -- Tokko Claymore to Ajja Claymore
    [  5] = {trade = {21718, {9782, 15}}, reward = 21719}, -- Tokko Axe      to Ajja Axe
    [  6] = {trade = {21775, {9782, 15}}, reward = 21776}, -- Tokko Chopper  to Ajja Chopper
    [  7] = {trade = {21826, {9782, 15}}, reward = 21827}, -- Tokko Scythe   to Ajja Scythe
    [  8] = {trade = {21879, {9782, 15}}, reward = 21880}, -- Tokko Lance    to Ajja Lance
    [  9] = {trade = {21918, {9782, 15}}, reward = 21919}, -- Tokko Katana   to Ajja Katana
    [ 10] = {trade = {21971, {9782, 15}}, reward = 21972}, -- Tokko Tachi    to Ajja Tachi
    [ 11] = {trade = {22027, {9782, 15}}, reward = 22028}, -- Tokko Rod      to Ajja Rod
    [ 12] = {trade = {22082, {9782, 15}}, reward = 22083}, -- Tokko Staff    to Ajja Staff
    [ 13] = {trade = {22108, {9782, 15}}, reward = 22109}, -- Tokko Bow      to Ajja Bow
	[ 14] = {trade = {22214, {9782, 15}}, reward = 22215}, -- Tokko Grip     to Ajja Grip
	[ 15] = {trade = {21516, {9783, 15}}, reward = 21517}, -- Ajja Knuckles  to Eletta Knucles
    [ 16] = {trade = {21562, {9783, 15}}, reward = 21563}, -- Ajja Knife     to Eletta Knife
    [ 17] = {trade = {21618, {9783, 15}}, reward = 21619}, -- Ajja Sword     to Eletta Sword
    [ 18] = {trade = {21671, {9783, 15}}, reward = 21672}, -- Ajja Claymore  to Eletta Claymore
    [ 19] = {trade = {21719, {9783, 15}}, reward = 21720}, -- Ajja Axe       to Eletta Axe
    [ 20] = {trade = {21776, {9783, 15}}, reward = 21777}, -- Ajja Chopper   to Eletta Chopper
    [ 21] = {trade = {21827, {9783, 15}}, reward = 21828}, -- Ajja Scythe    to Eletta Scythe
    [ 22] = {trade = {21880, {9783, 15}}, reward = 21881}, -- Ajja Lance     to Eletta Lance
    [ 23] = {trade = {21919, {9783, 15}}, reward = 21920}, -- Ajja Katana    to Eletta Katana
    [ 24] = {trade = {21972, {9783, 15}}, reward = 21973}, -- Ajja Tachi     to Eletta Tachi
    [ 25] = {trade = {22028, {9783, 15}}, reward = 22029}, -- Ajja Rod       to Eletta Rod
    [ 26] = {trade = {22083, {9783, 15}}, reward = 22084}, -- Ajja Staff     to Eletta Staff
    [ 27] = {trade = {22109, {9783, 15}}, reward = 22110}, -- Ajja Bow       to Eletta Bow
	[ 28] = {trade = {22215, {9783, 15}}, reward = 22216}, -- Ajja Grip      to Eletta Grip
}

function onTrade(player, npc, trade)
	local itemtrades
	local tradedCombo = 0
	
	-- Check for matching trade
	if tradedCombo == 0 and player:getCharVar("KillCounter_Kirin") >= 1 and player:getCharVar("KillCounter_JailofLove") >= 1 then
		for k, v in pairs(itemTrades) do
			if npcUtil.tradeHasExactly(trade, v.trade) then
				tradedCombo = k
				break
			end
		end
	end
	
	-- Found a match
	if tradedCombo > 0 then --  and not player:hasItem(itemTrades[tradedCombo].reward) 
		local ID = zones[player:getZoneID()]
		local reward = itemTrades[tradedCombo].reward
	
		for i = 1, 14 do
			if (tradedCombo == i and player:hasItem(itemTrades[tradedCombo].reward)) then
				player:messageSpecial(ID.text.CANNOT_OBTAIN_MORE)
				return
			end
		end
		
		player:confirmTrade()
		player:addItem(itemTrades[tradedCombo].reward, 1)
		player:messageSpecial(ID.text.ITEM_OBTAINED, itemTrades[tradedCombo].reward)
		player:PrintToPlayer(string.format("Sifa Alani : These weapons have limitless untapped potential."),tpz.msg.channel.NS_SAY)
	end
end

function onTrigger(player, npc)
	player:PrintToPlayer(string.format("Sifa Alani : I'm fascinated by the equipment of ambuscade!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

end
