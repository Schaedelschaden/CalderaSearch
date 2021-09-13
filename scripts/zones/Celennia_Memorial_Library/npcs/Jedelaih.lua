-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Jedelaih
-- !pos -99 -2 -104 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/npc_util")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
	local SealQty = trade:getItemQty(1126)
	local divided = SealQty / 3
	
	local trades =
	{
		{{1126, SealQty}}
	}
	
	if npcUtil.tradeHasExactly(trade, trades[1]) then
--		printf("Jedelaih.lua onTrade PROPER NUMBER OF SEALS")
		player:addItem(1127, divided)
		player:messageSpecial(ID.text.ITEM_OBTAINED, 1127)
		player:tradeComplete(trade)
	else
		player:PrintToPlayer(string.format("Jedelaih : What're ya tryin' to pull! I didn't ask for that!"),tpz.msg.channel.NS_SAY)
	end
end

function onTrigger(player,npc)
	player:PrintToPlayer(string.format("Jedelaih : Trade me 3x Beastmen Seals and I'll give you a Kindred Seal in return!"),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Jedelaih : I'll happily take as many seals as you can give me, just make sure they're in multiples of 3!"),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Jedelaih : Gahahaha! *madly strums away*"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player,csid,option)
	
end

function onEventFinish(player,csid,option)
	
end