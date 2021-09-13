-----------------------------------
-- Area: Ceizak Battlegrounds
-- NPC: ??? (H-6)
-- Used to access Colkhab's spawn area
-- !pos -100 0 320
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
	local colkhab = GetMobByID(17846658)
	
	if (colkhab:isSpawned() and colkhab:isEngaged()) then
		player:PrintToPlayer(string.format("The hideous aura of the Naakual prevents you from joining the fight!"),tpz.msg.channel.SYSTEM_3)
	else
		-- Moves the player to the other side of the barrier
		player:setPos(-99.9022, 0.4805, 364.0904, 174)
	end
end