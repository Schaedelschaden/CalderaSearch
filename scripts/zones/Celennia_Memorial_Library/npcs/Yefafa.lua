-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Yefafa
-- !pos -115.7428 -2.1500 -95.0393 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
-----------------------------------
function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
    player:PrintToPlayer(string.format("Yefafa : You want me to act like a Moogle huh!? Well, ku-po-po-KUPOW!"),tpz.msg.channel.NS_SAY)
    player:sendMenu(1)
end

function onEventUpdate(player, csid, option)
	player:PrintToPlayer(string.format("Yefafa : Ugh, you're making me do something?"),tpz.msg.channel.NS_SAY)
end

function onEventFinish(player, csid, option)
	player:PrintToPlayer(string.format("Yefafa : Ugh, you're making me do something?"),tpz.msg.channel.NS_SAY)
end