-----------------------------------
-- Area: Rala Waterways (258)
--  NPC: Sluice Gate #4
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
	if (player:getMainLvl() < 99) then
		player:PrintToPlayer(string.format("You must be level 99 or higher to pass through the sluice gate."),tpz.msg.channel.SYSTEM_3)
	else	
		if (player:getCharVar("KillCounter_AAHM") > 0 and player:getCharVar("KillCounter_AATT") > 0 and player:getCharVar("KillCounter_AAMT") > 0 and
			player:getCharVar("KillCounter_AAEV") > 0 and player:getCharVar("KillCounter_AAGK") > 0) then
			player:setPos(257.3327, -5.7675, 54.3911, 192, 258)
		else
			player:PrintToPlayer(string.format("You sense that the power of the Ark Angels is preventing you from passing through the sluices."),tpz.msg.channel.SYSTEM_3)
		end
	end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
