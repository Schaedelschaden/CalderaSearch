-----------------------------------
-- Area: Western Adoulin
--  NPC: Benjamien
-- Type: JSE Capes
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

-----------------------------------
-- Incursion Capes
-----------------------------------
local itemTrades =
{
	[  1] = {trade = {1426, {8933, 99}}, reward = 28617}, -- WAR test and 1 stacks Leafslit for Mauler's Mantle
    [  2] = {trade = {1427, {8942, 99}}, reward = 28618}, -- MNK test and 1 stacks Leaftip for Anchoret's Mantle
    [  3] = {trade = {1428, {8951, 99}}, reward = 28619}, -- WHM test and 1 stacks Leafdim for Mending Cape
    [  4] = {trade = {1429, {8960, 99}}, reward = 28620}, -- BLM test and 1 stacks Leaforb for Bane Cape
    [  5] = {trade = {1430, {8936, 99}}, reward = 28621}, -- RDM test and 1 stacks Duskslit for Ghostfyre Cape
    [  6] = {trade = {1431, {8945, 99}}, reward = 28622}, -- THF test and 1 stacks Dusktip for Canny Cape
    [  7] = {trade = {1432, {8954, 99}}, reward = 28623}, -- PLD test and 1 stacks Duskdim for Weard Mantle
    [  8] = {trade = {1433, {8963, 99}}, reward = 28624}, -- DRK test and 1 stacks Duskorb for Niht Mantle
    [  9] = {trade = {1434, {8930, 99}}, reward = 28625}, -- BST test and 1 stacks Snowslit for Pastoralist's Mantle
    [ 10] = {trade = {1435, {8939, 99}}, reward = 28626}, -- BRD test and 1 stacks Snowtip for Rhapsode's Cape
    [ 11] = {trade = {1436, {8948, 99}}, reward = 28627}, -- RNG test and 1 stacks Snowdim for Lutian Cape
    [ 12] = {trade = {1437, {8957, 99}}, reward = 28628}, -- SAM test and 1 stacks Snoworb for Takaha Mantle
    [ 13] = {trade = {1438, {8933, 99}}, reward = 28629}, -- NIN test and 1 stacks Leafslit for Yokaze Mantle
	[ 14] = {trade = {1439, {8942, 99}}, reward = 28630}, -- DRG test and 1 stacks Leaftip for Updraft Mantle
	[ 15] = {trade = {1440, {8951, 99}}, reward = 28631}, -- SMN test and 1 stacks Leafdim for Conveyance Cape
	[ 16] = {trade = {2331, {8960, 99}}, reward = 28632}, -- BLU test and 1 stacks Leaforb for Cornflower Cape
	[ 17] = {trade = {2332, {8936, 99}}, reward = 28633}, -- COR test and 1 stacks Duskslit for Gunslinger's Cape
	[ 18] = {trade = {2333, {8945, 99}}, reward = 28634}, -- PUP test and 1 stacks Dusktip for Dispersal Mantle
	[ 19] = {trade = {2556, {8954, 99}}, reward = 28635}, -- DNC test and 1 stacks Duskdim for Toetapper Mantle
	[ 20] = {trade = {2557, {8963, 99}}, reward = 28636}, -- SCH test and 1 stacks Duskorb for Bookworm's Cape
	[ 21] = {trade = {1429, {8930, 99}}, reward = 28637}, -- BLM test and 1 stacks Snowslit for Lifestream Cape
	[ 22] = {trade = {1432, {8939, 99}}, reward = 28638}, -- PLD test and 1 stacks Snowtip for Evasionist's Cape
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
	
		for i = 1, 22 do
			if (tradedCombo == i and player:hasItem(itemTrades[tradedCombo].reward)) then
				player:messageSpecial(ID.text.CANNOT_OBTAIN_MORE)
				return
			end
		end
		
		player:confirmTrade()
		player:addItem(itemTrades[tradedCombo].reward, 1)
		player:messageSpecial(ID.text.ITEM_OBTAINED, itemTrades[tradedCombo].reward)
		player:PrintToPlayer(string.format("Benjamien : I think this will look dashing on you!"),tpz.msg.channel.NS_SAY)
	end
end

function onTrigger(player, npc)
	player:PrintToPlayer(string.format("Benjamien : I've recently begun using magic stones from the wilds to craft amazing capes!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

end