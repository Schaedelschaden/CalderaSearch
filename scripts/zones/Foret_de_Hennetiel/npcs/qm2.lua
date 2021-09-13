-----------------------------------
-- Area: Foret de Hennetiel
-- NPC: ??? (G-10)
-- Used to escape Tchakka's spawn area
-- !pos -100 0.757 -346
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
	local tchakka = GetMobByID(17850783)
	
	if (tchakka:isSpawned() and tchakka:isEngaged()) then
		player:PrintToPlayer(string.format("The hideous aura of the Naakual prevents you from escaping the fight!"),tpz.msg.channel.SYSTEM_3)
	else
		-- Moves the player to the other side of the barrier
		player:setPos(-179.627, -0.594, -245.974, 182)
	end
end