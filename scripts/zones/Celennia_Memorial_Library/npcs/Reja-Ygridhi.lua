-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Reja Ygridhi
-- Standard Merchant NPC
-- !pos -110.7740 -2.1500 -103.7501 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
	
end;

function onTrigger(player,npc)
	local trigger = math.random(1);
	
	if (trigger == 1) then
		player:PrintToPlayer(string.format("Reja Ygridhi : You want to learn the secrets of DA FLIPS? Buy all my wares and you too can be a master of DA FLIPS!!!"),tpz.msg.channel.NS_SAY);
    local stock =
    {
        18633, 20000,     -- Chatoyant Staff
        20694, 1000000,   -- Fermion Sword
        21693, 1000000,   -- Irradiance Blade
        27590, 20000,     -- Shneddick Ring
    }

    tpz.shop.general(player, stock)

	end
end;

function onEventUpdate(player,csid,option)
	
end;

function onEventFinish(player,csid,option)
	
end;