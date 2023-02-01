---------------------------------------------------------------------------------------------------
-- func: setlocalvar <varName> <player/mob/npc> <ID>
-- desc: set player npc or mob local variable and value.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!setlocalvar <variable name> <value> {'player', 'mob', or 'npc'} {name or ID}")
end

function onTrigger(player, arg1, arg2, arg3, arg4)
    local targ = player:getCursorTarget()

    if targ == nil or targ:getObjType() ~= tpz.objType.NPC then
        player:PrintToPlayer(string.format("You must target an NPC for this command!"))
        return
    end

    targ:setLocalVar("Besieged_Start_Time", 0)
    targ:setLocalVar("Besieged_Active", 0)
    targ:setLocalVar("wave", 0)
    player:PrintToPlayer(string.format("Reset %s's Besieged variables.", targ:getName()))
end
