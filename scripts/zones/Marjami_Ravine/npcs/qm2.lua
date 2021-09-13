-----------------------------------
-- Area: Marjami Ravine
-- NPC: ??? (H-7)
-- Used to escape Hurkan's spawn area
-- !pos 25.866 -59.901 177.930
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
	local hurkan = GetMobByID(17867043)
	
	if (hurkan:isSpawned() and hurkan:isEngaged()) then
		player:PrintToPlayer(string.format("The hideous aura of the Naakual prevents you from escaping the fight!"),tpz.msg.channel.SYSTEM_3)
	else
		-- Moves the player to the other side of the barrier
		player:setPos(-13.2890, 0.2753, 179.4584, 128)
	end
end