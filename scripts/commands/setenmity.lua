---------------------------------------------------------------------------------------------------
-- func: setenmity
-- desc: Sets the players CE and VE to the specified value.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "isi"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!setenmity <amount> <player> <mob>")
end

function onTrigger(player, amount, target, mob)
	-- validate monster target
	local mobTarget
    if (mob == nil) then
        mobTarget = player:getCursorTarget()
        if (mobTarget == nil or not mobTarget:isMob()) then
            error(player, "You must either supply a mob ID or target a mob.")
            return
        end
    else
        mobTarget = GetMobByID(mob)
        if (mobTarget == nil) then
            error(player, "Invalid mob ID.")
            return
        end
    end

	-- validate player target
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

    -- validate amount
    if (amount == nil or amount < 0) then
        error(player, "Invalid amount.")
        return
    end

    mobTarget:setCE(targ, amount)
	mobTarget:setVE(targ, amount)
    player:PrintToPlayer(string.format("%s's CE & VE was set to %i.", targ:getName(), amount))
end
