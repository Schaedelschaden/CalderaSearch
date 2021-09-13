-----------------------------------
-- Area: Ceizak Battlegrounds
-- NPC: ??? (H-6)
-- Used to escape Colkhab's spawn area
-- !pos -100 0 360
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
	local colkhab = GetMobByID(17846658)
	
	if (colkhab:isSpawned() and colkhab:isEngaged()) then
		player:PrintToPlayer(string.format("The hideous aura of the Naakual prevents you from escaping the fight!"),tpz.msg.channel.SYSTEM_3)
	else
		-- Moves the player to the other side of the barrier
		player:setPos(-101.201, 0.3417, 316.767, 84)
	end
end