---------------------------------------------------------------------------------------------------
-- func: !setanimationsub <sub id>
-- desc: Used to manipulate a mob's animation.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!setanimationsub {animation ID}")
end

function onTrigger(player, animID)
    -- validate target
    local targ
    if target == nil then
        targ = player:getCursorTarget()

        if targ == nil or not targ:isMob() then
            error(player, "You must either supply a mob ID or target a mob.")
            return
        end
    else
        targ = GetMobByID(target)
        if targ == nil then
            error(player, "Invalid mob ID.")
            return
        end
    end

    -- Set model
    targ:AnimationSub(animID)
    player:PrintToPlayer( string.format("Set %s's animation to %i.", targ:getName(), animID) )
end
