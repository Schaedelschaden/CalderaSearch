-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Jedelaih
-- !pos -99 -2 -104 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
	
end;

function onTrigger(player,npc)
	player:PrintToPlayer(string.format("Jedelaih : Gahahaha! *madly plucks away*"),tpz.msg.channel.NS_SAY)
end;

function onEventUpdate(player,csid,option)
	
end;

function onEventFinish(player,csid,option)
	
end;