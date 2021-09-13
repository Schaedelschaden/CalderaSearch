-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Trail Markings
-- Dynamis-San d'Oria Enter
-- !pos 139 -2 122 230
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
	if (player:getCharVar("KillCounter_ShadowLord") >= 1) then
		dynamis.entryNpcOnTrigger(player, npc)
	else
		player:PrintToPlayer(string.format("You have the feeling that the power of the Shadow Lord is blocking you from entering.",tpz.msg.channel.SYSTEM_3))
	end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dynamis.entryNpcOnEventFinish(player, csid, option)
end