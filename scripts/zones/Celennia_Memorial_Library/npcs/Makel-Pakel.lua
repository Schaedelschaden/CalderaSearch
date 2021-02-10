-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Makel-Pakel
-- !pos -106 -2 -99 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
	
end;

function onTrigger(player,npc)
	local trigger = math.random(1,6)
	
	if (trigger == 1) then
--		player:PrintToPlayer(string.format("Makel-Pakel : *sniffle* G-g-go away! Some weird guy named Lmfaoo dresses up like a dancer and keeps assaulting me!"),tpz.msg.channel.NS_SAY)
		player:PrintToPlayer(string.format("Makel-Pakel : I'm in recovery!"),tpz.msg.channel.NS_SAY)
	elseif (trigger == 2) then
--		player:PrintToPlayer(string.format("Makel-Pakel : *whimper* Lmfaoo only makes me call him daddy..."),tpz.msg.channel.NS_SAY)
		player:PrintToPlayer(string.format("Makel-Pakel : *glances around suspiciously*"),tpz.msg.channel.NS_SAY)
	elseif (trigger == 3) then
--		player:PrintToPlayer(string.format("Makel-Pakel : No! Please!"),tpz.msg.channel.NS_SAY)
		player:PrintToPlayer(string.format("Makel-Pakel : You haven't seen someone named Lmfaoo around have you?"),tpz.msg.channel.NS_SAY)
	elseif (trigger == 4) then
--		player:PrintToPlayer(string.format("Makel-Pakel : W-w-where am I?"),tpz.msg.channel.NS_SAY)
		player:PrintToPlayer(string.format("Makel-Pakel : Gah! You scared me!"),tpz.msg.channel.NS_SAY)
	elseif (trigger == 5) then
--		player:PrintToPlayer(string.format("Makel-Pakel : Who are you?!"),tpz.msg.channel.NS_SAY)
		player:PrintToPlayer(string.format("Makel-Pakel : You're not going to start dancing are you?"),tpz.msg.channel.NS_SAY)
	elseif (trigger == 6) then
--		player:PrintToPlayer(string.format("Makel-Pakel : How did I get here?!"),tpz.msg.channel.NS_SAY)
		player:PrintToPlayer(string.format("Makel-Pakel : *heaves a sigh of relief*"),tpz.msg.channel.NS_SAY)
	end
end

function onEventUpdate(player,csid,option)
	
end

function onEventFinish(player,csid,option)
	
end