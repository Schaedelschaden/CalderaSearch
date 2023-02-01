---------------------------------------------------------------------------------------------------
-- func: setcharvar <varName> <ID>
-- desc: set player char variable and value.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "siss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!setlocalvar <variable name> <value> <target>")
end

function onTrigger(player, arg1, arg2, arg3)
    local varName  = arg1
    local varValue = arg2
    local targ

    if varName == nil then
        error(player, "You must provide a variable name.")
        return
    end

    if varValue == nil then
        error(player, "No variable value given for target.")
        return
    end

    if arg3 == nil then
        targ = player:getCursorTarget()
    end

    if targ == nil then
        targ = player
    end

    targ:setCharVar(varName, varValue)
    player:PrintToPlayer(string.format("%s's variable '%s' : %i", targ:getName(), varName, varValue))
end
