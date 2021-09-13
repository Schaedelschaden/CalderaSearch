-----------------------------------
-- Area: Yorcia Weald
-- NPC: ??? (E-9)
-- Used to escape Yumcax's spawn area
-- !pos -445 0 -100
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
	local yumcax = GetMobByID(17854848)
	
	if (yumcax:isSpawned() and yumcax:isEngaged()) then
		player:PrintToPlayer(string.format("The hideous aura of the Naakual prevents you from escaping the fight!"),tpz.msg.channel.SYSTEM_3)
	else
		-- Moves the player to the other side of the barrier
		player:setPos(-420.0635, 0.2110, -70.8102, 198)
	end
end