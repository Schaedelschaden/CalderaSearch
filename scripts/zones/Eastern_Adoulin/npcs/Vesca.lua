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


-----------------------------------
-- HP Bayld Trade
-----------------------------------
local itemTrades =
{
	[  1] = {trade = {1606, {8798, 99}}, reward = 4069}, -- Burning Memory for Rem's Chap 6
    [  2] = {trade = {1607, {8798, 99}}, reward = 4070}, -- Bitter Memory for Rem's Chap 7
    [  3] = {trade = {1608, {8798, 99}}, reward = 4071}, -- Fleeting Memory for Rem's Chap 8
    [  4] = {trade = {1609, {8798, 99}}, reward = 4072}, -- Profane Memory for Rem's Chap 9
    [  5] = {trade = {1610, {8798, 99}}, reward = 4073}, -- Startling Memory for Rem's Chap 10
    [  6] = {trade = {1606, {8798, 50}}, reward = 27585}, -- Burning Memory for Gorney ring
    [  7] = {trade = {1607, {8798, 50}}, reward = 27582}, -- Bitter Memory for Weatherspoon Ring
    [  8] = {trade = {1608, {8798, 50}}, reward = 27590}, -- Fleeting Memory for Shneddick Ring
    [  9] = {trade = {1609, {8798, 50}}, reward = 11625}, -- Profane Memory for Twilight Torque
    [ 10] = {trade = {1610, {8798, 50}}, reward = 28437}, -- Startling Memory for Flume Belt +1
    [ 11] = {trade = {1611, {8798, 50}}, reward = 27581}, -- Somber Memory for Woltaris Ring
    [ 12] = {trade = {1612, {8798, 50}}, reward = 27584}, -- Radiant Memory for Renaye Ring
    [ 13] = {trade = {1613, {8798, 50}}, reward = 16259}, -- Malevolent Memory for Twilight Cape
	[ 14] = {trade = {{1456, 3}, {8798, 693}}, reward = 27588}, -- Hundred Byne Bill for Vocane Ring
	[ 15] = {trade = {{1450, 3}, {8798, 693}}, reward = 27587}, -- Lungo-Nango Jadeshell for Karieyh Ring
	[ 16] = {trade = {{1453, 3}, {8798, 693}}, reward = 27583}, -- Montiont Silverpiece for Janniston Ring
	[ 17] = {trade = {28662, {8798, 20}}, reward = 28654}, -- Beatific Shield +1
	[ 18] = {trade = {27768, {8798, 20}}, reward = 27728}, -- Cizin Helm +1
	[ 19] = {trade = {27912, {8798, 20}}, reward = 27874}, -- Cizin Mail +1
	[ 20] = {trade = {28051, {8798, 20}}, reward = 28018}, -- Cizin Mufflers +1
	[ 21] = {trade = {28192, {8798, 20}}, reward = 28160}, -- Cizin Breeches +1
	[ 22] = {trade = {28332, {8798, 20}}, reward = 28297}, -- Cizin Greaves +1
	[ 23] = {trade = {27771, {8798, 20}}, reward = 27731}, -- Gendewitha Caubeen +1
	[ 24] = {trade = {27915, {8798, 20}}, reward = 27877}, -- Gendewitha Bliaut +1
	[ 25] = {trade = {28054, {8798, 20}}, reward = 28021}, -- Gendewitha Gages +1
	[ 26] = {trade = {28195, {8798, 20}}, reward = 28163}, -- Gendewitha Spats +1
	[ 27] = {trade = {28335, {8798, 20}}, reward = 28300}, -- Gendewitha Galoshes +1
	[ 28] = {trade = {27772, {8798, 20}}, reward = 27732}, -- Hagondes Hat +1
	[ 29] = {trade = {27916, {8798, 20}}, reward = 27878}, -- Hagondes Coat +1
	[ 30] = {trade = {28055, {8798, 20}}, reward = 28022}, -- Hagondes Cuffs +1
	[ 31] = {trade = {28196, {8798, 20}}, reward = 28164}, -- Hagondes Pants +1
	[ 32] = {trade = {28336, {8798, 20}}, reward = 28301}, -- Hagondes Sabots +1
	[ 33] = {trade = {27769, {8798, 20}}, reward = 27729}, -- Otronif Mask +1
	[ 34] = {trade = {27913, {8798, 20}}, reward = 27875}, -- Otronif Harness +1
	[ 35] = {trade = {28052, {8798, 20}}, reward = 28019}, -- Otronif Gloves +1
	[ 36] = {trade = {28193, {8798, 20}}, reward = 28161}, -- Otronif Brais +1
	[ 37] = {trade = {28333, {8798, 20}}, reward = 28298}, -- Otronif Boots +1
	[ 38] = {trade = {27770, {8798, 20}}, reward = 27730}, -- Iuitl Headgear +1
	[ 39] = {trade = {27914, {8798, 20}}, reward = 27876}, -- Iuitl Vest +1
	[ 40] = {trade = {28053, {8798, 20}}, reward = 28020}, -- Iuitl Wristbands +1
	[ 41] = {trade = {28194, {8798, 20}}, reward = 28162}, -- Iuitl Tights +1
	[ 42] = {trade = {28334, {8798, 20}}, reward = 28299}, -- Iuitl Gaiters +1
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
	
		for i = 6, 16 do
			if (tradedCombo == i and player:hasItem(itemTrades[tradedCombo].reward)) then
				player:messageSpecial(ID.text.CANNOT_OBTAIN_MORE)
				return
			end
		end
		
		player:confirmTrade()
		player:addItem(itemTrades[tradedCombo].reward, 1)
		player:messageSpecial(ID.text.ITEM_OBTAINED, itemTrades[tradedCombo].reward)
		player:PrintToPlayer(string.format("Vesca : More! I need more! Bring me more!"),tpz.msg.channel.NS_SAY)
	end
end

function onTrigger(player, npc)
	player:PrintToPlayer(string.format("Vesca : I've heard of a place under Xarcarbard filled with memories and the purest Bayld. Bring them to me!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

end
