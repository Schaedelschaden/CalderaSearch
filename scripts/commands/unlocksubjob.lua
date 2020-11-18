---------------------------------------------------------------------------------------------------
-- func: !unlocksubjob
-- desc: Unlocks the player's subjob
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!unlocksubjob {player}")
end

function onTrigger(player, target)
    -- validate target
    local targ
    local cursor_target = player:getCursorTarget()
	
    if (not target) and (not cursor_target) then
        targ = player
    elseif target then
        targ = GetPlayerByName(target)
        if (targ == nil) then
            error(player, string.format( "Player named '%s' not found!", target ) )
            return
        end
    elseif cursor_target then
        targ = cursor_target
    end

	if not (targ == nil) then
		targ:unlockJob(0)
		player:PrintToPlayer(string.format("%s's subjob has been unlocked!", targ:getName()))
	end
end