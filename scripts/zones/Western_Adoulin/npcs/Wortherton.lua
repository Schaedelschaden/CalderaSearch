-----------------------------------
-- Area: Eastern Adoulin (257)
--  NPC: Vesca
-- Type: Bayld Trade
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------
-- Wotherton
-- Western Adoulin
-----------------------------------
-- Unity Accessory Upgrades
-----------------------------------
local itemTrades =
{
	[  1] = {trade = {28429, {8732, 3}}, reward = 28430}, -- Acuity Belt +1
    [  2] = {trade = {27560, {8732, 3}}, reward = 27561}, -- Apeile Ring +1
    [  3] = {trade = {28486, {8732, 3}}, reward = 28487}, -- Arete del luna +1
    [  4] = {trade = {27619, {8732, 3}}, reward = 27620}, -- Aurist's Cape +1
    [  5] = {trade = {27517, {8732, 3}}, reward = 27518}, -- Bathy Choker +1
    [  6] = {trade = {10770, {8732, 3}}, reward = 10771}, -- Cacoethic Ring +1
    [  7] = {trade = {28352, {8732, 3}}, reward = 28353}, -- Canto Necklace +1
    [  8] = {trade = {27542, {8732, 3}}, reward = 27543}, -- Dominance Earring +1
    [  9] = {trade = {27609, {8732, 3}}, reward = 27610}, -- Fi Follet Cape +1
    [ 10] = {trade = {10768, {8732, 3}}, reward = 10769}, -- Gelatinous Ring +1
	[ 11] = {trade = {21343, {8732, 3}}, reward = 21344}, -- Ghastly Tathlum +1
    [ 12] = {trade = {27600, {8732, 3}}, reward = 27601}, -- Grounded Mantle +1
    [ 13] = {trade = {28490, {8732, 3}}, reward = 28491}, -- Handler's Earring +1
    [ 14] = {trade = {28412, {8732, 3}}, reward = 28413}, -- Kentarch Belt +1
    [ 15] = {trade = {26001, {8732, 3}}, reward = 26002}, -- Loricate Torque +1
    [ 16] = {trade = {28481, {8732, 3}}, reward = 28482}, -- Lugra Earring +1
    [ 17] = {trade = {27558, {8732, 3}}, reward = 27559}, -- Mephitas's Ring +1
    [ 18] = {trade = {27562, {8732, 3}}, reward = 27563}, -- Metamorph Ring +1
    [ 19] = {trade = {28484, {8732, 3}}, reward = 28485}, -- Nourishing Earring +1
    [ 20] = {trade = {27548, {8732, 3}}, reward = 27549}, -- Odnowa Earring +1
	[ 21] = {trade = {28427, {8732, 3}}, reward = 28428}, -- Sailfi Belt +1
    [ 22] = {trade = {28423, {8732, 3}}, reward = 28424}, -- Shinjutsu-no-obi +1
    [ 23] = {trade = {22254, {8732, 3}}, reward = 22255}, -- Seething Bomblet +1
    [ 24] = {trade = {27508, {8732, 3}}, reward = 27509}, -- Unmoving Collar +1
    [ 25] = {trade = {26021, {8732, 3}}, reward = 26022}, -- Vim Torque +1
    [ 26] = {trade = {27504, {8732, 3}}, reward = 27505}, -- Warder's Charm +1
    [ 27] = {trade = {27532, {8732, 3}}, reward = 27533}, -- Zwazo Earring +1
	[ 28] = {trade = {21402, {8732, 1}}, reward = 21403}, -- Damani Horn +1
	[ 29] = {trade = {28350, {8732, 1}}, reward = 28351}, -- Damani Horn +1
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
	
		for i = 1, 29 do
			if (tradedCombo == i and player:hasItem(itemTrades[tradedCombo].reward)) then
				player:messageSpecial(ID.text.CANNOT_OBTAIN_MORE)
				return
			end
		end
		
		player:confirmTrade()
		player:addItem(itemTrades[tradedCombo].reward, 1)
		player:messageSpecial(ID.text.ITEM_OBTAINED, itemTrades[tradedCombo].reward)
		player:PrintToPlayer(string.format("Wortherton : Now that's a real Unity accessory!"),tpz.msg.channel.NS_SAY)
	end
end

function onTrigger(player, npc)
	player:PrintToPlayer(string.format("Wortherton : Unity accessories? Looks weak! Bring me some Kupon I-S3."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

end
