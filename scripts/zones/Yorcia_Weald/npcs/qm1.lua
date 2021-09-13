-----------------------------------
-- Area: Yorcia Weald
-- NPC: ??? (E-9)
-- Used to access Yumcax's spawn area
-- !pos -420 0 -75
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
	local yumcax = GetMobByID(17854848)
	
	if (yumcax:isSpawned() and yumcax:isEngaged()) then
		player:PrintToPlayer(string.format("The hideous aura of the Naakual prevents you from joining the fight!"),tpz.msg.channel.SYSTEM_3)
	else
		-- Moves the player to the other side of the barrier
		player:setPos(-449.5768, 0.3552, -99.7411, 132)
	end
end