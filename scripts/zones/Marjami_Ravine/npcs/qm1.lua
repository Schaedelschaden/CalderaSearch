-----------------------------------
-- Area: Marjami Ravine
-- NPC: ??? (H-7)
-- Used to access Hurkan's spawn area
-- !pos -9.2 0 180
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
	local hurkan = GetMobByID(17867043)
	
	if (hurkan:isSpawned() and hurkan:isEngaged()) then
		player:PrintToPlayer(string.format("The hideous aura of the Naakual prevents you from joining the fight!"),tpz.msg.channel.SYSTEM_3)
	else
		-- Moves the player to the other side of the barrier
		player:setPos(29.5816, -59.3713, 180.2445, 255)
	end
end