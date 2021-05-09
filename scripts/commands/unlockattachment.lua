---------------------------------------------------------------------------------------------------
-- func: unlockattachment
-- desc: Unlocks the specified attachment for the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
}

function onTrigger(player, target, id)
	local targ = GetPlayerByName(target)
	if (targ == nil) then
		player:PrintToPlayer(string.format( "Player named '%s' not found!", target ))
	elseif (id == nil) then
		player:PrintToPlayer(string.format( "Item ID '%i' not found!", id ))
	else
		targ:unlockAttachment(id)
		player:PrintToPlayer(string.format( "Unlocked attachment '%i' for %s.", id, target ))
	end
end