---------------------------------------------------------------------------------------------------
-- func: !home
-- desc: Sends the player to their homepoint.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!home {player}")
end

function onTrigger(player, target)
    -- validate target
    local targ
    if (target == nil) then
        targ = player
    else
        targ = GetPlayerByName( target )
        if (targ == nil) then
            error(player, string.format( "Player named '%s' not found!", target ) )
            return
        end
    end

    -- warp target
    targ:warp()
    if (targ:getID() ~= player:getID()) then
        player:PrintToPlayer(string.format("Sent %s to their homepoint.",targ:getName()))
    end
end
