-----------------------------------
-- Area: Morimar Basalt Fields
-- NPC: ??? (E-5)
-- Used to escape Achuka's spawn area
-- !pos -420 -63.5 462
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
	local achuka = GetMobByID(17863277)
	
	if (achuka:isSpawned() and achuka:isEngaged()) then
		player:PrintToPlayer(string.format("The hideous aura of the Naakual prevents you from escaping the fight!"),tpz.msg.channel.SYSTEM_3)
	else
		-- Moves the player to the other side of the barrier
		player:setPos(-417.5074, -63.2831, 414.7405, 33)
	end
end