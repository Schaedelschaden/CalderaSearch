-----------------------------------
-- Area: Foret de Hennetiel
-- NPC: ??? (F-10)
-- Used to access Tchakka's spawn area
-- !pos -180 0.781 -254
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
	local tchakka = GetMobByID(17850783)
	
	if (tchakka:isSpawned() and tchakka:isEngaged()) then
		player:PrintToPlayer(string.format("The hideous aura of the Naakual prevents you from joining the fight!"),tpz.msg.channel.SYSTEM_3)
	else
		-- Moves the player to the other side of the barrier
		player:setPos(-99.9022, -0.6401, -355.0395, 66)
	end
end