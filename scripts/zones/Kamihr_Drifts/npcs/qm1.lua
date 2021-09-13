-----------------------------------
-- Area: Kamihr Drifts
-- NPC: ??? (I-6)
-- Used to access Kumhau's spawn area
-- !pos 212 19.6 330.500
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
	local kumhau = GetMobByID(17871084)
	
	if (kumhau:isSpawned() and kumhau:isEngaged()) then
		player:PrintToPlayer(string.format("The hideous aura of the Naakual prevents you from joining the fight!"),tpz.msg.channel.SYSTEM_3)
	else
		-- Moves the player to the other side of the barrier
		player:setPos(277.8572, 20, 320.4657, 22)
	end
end