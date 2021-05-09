--------------------------------------------------------------
-- func: !kill <player>
-- auth: Klutix
-- desc: Kills the specified player.
--------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s" 
}

function onTrigger(player, target)
    -- validate target
    local targ
    if (target == nil) then
        targ = player
    else
        targ = GetPlayerByName(target)
		
		if (targ:getName() == "Khalum" or targ:getName() == "Naria") then
			player:PrintToPlayer(string.format("You dare try to use my own spells against me?!"),tpz.msg.channel.SYSTEM_3)
			player:injectActionPacket(4, 241) -- Meteor
			player:injectActionPacket(4, 280) -- Meteor II
			KillPlayerByName(player:getName())
			return
		end
		
		if (targ:getName() == "Tierkaintwo") then
			return
		end
		
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target))
            return
        end
    end
--	targ:injectActionPacket(6, 93) -- Mijin Gakure
--	targ:injectActionPacket(4, 219) -- Comet
	targ:injectActionPacket(4, 241) -- Meteor
	targ:injectActionPacket(4, 280) -- Meteor II
    
	KillPlayerByName(targ:getName())
end