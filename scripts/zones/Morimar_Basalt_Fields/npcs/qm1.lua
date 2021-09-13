-----------------------------------
-- Area: Morimar Basalt Fields
-- NPC: ??? (E-5)
-- Used to access Achuka's spawn area
-- !pos -421 -63.6 418
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
	local achuka = GetMobByID(17863277)
	
	if (achuka:isSpawned() and achuka:isEngaged()) then
		player:PrintToPlayer(string.format("The hideous aura of the Naakual prevents you from joining the fight!"),tpz.msg.channel.SYSTEM_3)
	else
		-- Moves the player to the other side of the barrier
		player:setPos(-424.6308, -63.0626, 468.143, 159)
	end
end