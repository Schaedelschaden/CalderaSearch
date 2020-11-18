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