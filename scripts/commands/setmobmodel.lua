---------------------------------------------------------------------------------------------------
-- func: setmobmodel <model id>
-- desc: Used to manipulate a mob's model/appearance.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!setmobmodel {model ID}")
end

function onTrigger(player, modelID)
    -- validate target
    local targ
    if (target == nil) then
        targ = player:getCursorTarget()
        if (targ == nil or not targ:isMob()) then
            error(player, "You must either supply a mob ID or target a mob.")
            return
        end
    else
        targ = GetMobByID(target)
        if (targ == nil) then
            error(player, "Invalid mob ID.")
            return
        end
    end

    -- Set model
    targ:setModelId(modelID)
    player:PrintToPlayer( string.format("Set %s model to %i.", targ:getName(), modelID) )
end