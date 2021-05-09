---------------------------------------------------------------------------------------------------
-- func: !lockstyle <target> <number>
-- desc: Visually changes the player's equipment.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "is"
}

function onTrigger(player, set, target)
	if (set == nil) then
        player:PrintToPlayer("You must enter a number between 1 and 471.")
        return
    end
	
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

	for i = 4, 8 do
		targ:setModelId(set, i)
	end
end