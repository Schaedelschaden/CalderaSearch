-----------------------------------
-- Area: Norg
--  NPC: Achika
-- Type: Tenshodo Merchant
-- !pos 1.300 0.000 19.259 252
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/shop")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Norg/IDs")
-----------------------------------

local itemTrades =
{
	[  1] = {trade = {{9084, 5}}, reward = 9085}, -- Eschalixer to Eschalixer +1
    [  2] = {trade = {{9085, 4}}, reward = 9086}, -- Eschalixer +1 to Eschalixer +2
    [  3] = {trade = {9085}, reward = 9084}, -- Eschalixer +1 to Eschalixer         Set qty to 5
    [  4] = {trade = {9086}, reward = 9085}, -- Eschalixer +2 to Eschalixer +1      Set qty to 4
}

function onTrade(player, npc, trade)
	local itemtrades
	local tradedCombo = 0
	
	-- Check for matching trade
	if tradedCombo == 0 then -- and player:getCharVar("KillCounter_Kirin") >= 1 and player:getCharVar("KillCounter_JailofLove") >= 1 then
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

		
		player:confirmTrade()
		player:addItem(itemTrades[tradedCombo].reward, 1)
		player:messageSpecial(ID.text.ITEM_OBTAINED, itemTrades[tradedCombo].reward)
		player:PrintToPlayer(string.format("Achika : I'll gladly trade more Eschalixer."),tpz.msg.channel.NS_SAY)
	end
end

function onTrigger(player, npc)
    if (player:hasKeyItem(tpz.ki.TENSHODO_MEMBERS_CARD)) then
        if (player:sendGuild(60421, 9, 23, 7)) then
            player:showText(npc, ID.text.ACHIKA_SHOP_DIALOG)
        end
    else
        -- player:startEvent(150)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
