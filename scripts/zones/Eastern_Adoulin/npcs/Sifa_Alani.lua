-----------------------------------
-- Area: Eastern Adoulin (257)
--  NPC: Sifa Alani
-- Type: Ambuscade Equipment
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
    [  2] = {trade = {21561, {9782, 15}}, reward = 21562}, -- Tokko Knife to Ajja Knife
    [  3] = {trade = {21617, {9782, 15}}, reward = 21618}, -- Tokko Sword to Ajja Sword
    [  4] = {trade = {21670, {9782, 15}}, reward = 21671}, -- Tokko Claymore to Ajja Claymore
    [  5] = {trade = {21718, {9782, 15}}, reward = 21719}, -- Tokko Axe to Ajja Axe
    [  6] = {trade = {21775, {9782, 15}}, reward = 21776}, -- Tokko Chopper to Ajja Chopper
    [  7] = {trade = {21826, {9782, 15}}, reward = 21827}, -- Tokko Scythe to Ajja Scythe
    [  8] = {trade = {21879, {9782, 15}}, reward = 21880}, -- Tokko Lance to Ajja Lance
    [  9] = {trade = {21918, {9782, 15}}, reward = 21919}, -- Tokko Katana to Ajja Katana
    [ 10] = {trade = {21971, {9782, 15}}, reward = 21972}, -- Tokko Tachi to Ajja Tachi
    [ 11] = {trade = {22027, {9782, 15}}, reward = 22028}, -- Tokko Rod to Ajja Rod
    [ 12] = {trade = {22082, {9782, 15}}, reward = 22083}, -- Tokko Staff to Ajja Staff
    [ 13] = {trade = {22108, {9782, 15}}, reward = 22109}, -- Tokko Bow to Ajja Bow
	[ 14] = {trade = {22214, {9782, 15}}, reward = 22215}, -- Tokko Grip to Ajja Grip
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
