-----------------------------------
-- Area: Kamihr Drifts
-- NPC: ??? (J-6)
-- Used to escape Kumhau's spawn area
-- !pos 272.275 19.322 329.905
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
	local kumhau = GetMobByID(17871084)
	
	if (kumhau:isSpawned() and kumhau:isEngaged()) then
		player:PrintToPlayer(string.format("The hideous aura of the Naakual prevents you from escaping the fight!"),tpz.msg.channel.SYSTEM_3)
	else
		-- Moves the player to the other side of the barrier
		player:setPos(200.5766, 20, 319.2079, 126)
	end
end