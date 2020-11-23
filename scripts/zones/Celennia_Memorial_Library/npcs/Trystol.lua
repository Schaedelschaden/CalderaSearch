-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Trystol
-- !pos -101 -2 -84 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
	
end;

function onTrigger(player,npc)
	player:PrintToPlayer(string.format("Trystol : Oh my, you look delicious! Would you like some candy...?"),tpz.msg.channel.NS_SAY)
end;

function onEventUpdate(player,csid,option)
	
end;

function onEventFinish(player,csid,option)
	
end;