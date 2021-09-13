-----------------------------------
-- Area: Bastok Mines
--  NPC: Trail Markings
-- Dynamis-Bastok Enter
-- !pos 99 1 -67 234
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
	end  -- Either Mere's kill counter didn't take, or it's not like this
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dynamis.entryNpcOnEventFinish(player, csid, option)
end