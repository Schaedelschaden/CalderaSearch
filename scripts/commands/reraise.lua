-----------------------------------------------------------------------
-- func: !reraise <power> <player>
-- desc: Gives the target player Reraise.
-----------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!reraise {power} {player}")
end

function onTrigger(player, arg1, arg2)
    local power
    local target
    local targ

    -- decide inputs
    if (arg2 ~= nil) then
        power = tonumber(arg1)
        target = arg2
    elseif (arg1 ~= nil) then
        if (GetPlayerByName(arg1) == nil) then
            power = tonumber(arg1)
        else
            target = arg1
        end
    end

    -- validate power
    if (power == nil or power > 3) then
        power = 3
    elseif (power < 1) then
        power = 1
    end

    -- validate target
    if (target == nil) then
        targ = player
    else
        targ = GetPlayerByName(target)
        if (targ == nil) then
            error(player, string.format( "Player named '%s' not found!", target ) )
            return
        end
    end

    -- Give Reraise to target
    targ:addStatusEffect(tpz.effect.RERAISE, power, 0, 3600)
	player:PrintToPlayer( string.format( "Gave %s Reraise %s.", targ:getName(), power ) )
end
