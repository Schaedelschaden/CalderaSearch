---------------------------------------------------------------------------------------------------
-- func: getlocalvar <varName> <player/mob/npc> <ID>
-- desc: get player npc or mob local variable and value.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "sss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!setlocalvar <variable name> {'player', 'mob', or 'npc'} {name or ID}")
end

function onTrigger(player, arg1, arg2, arg3, arg4)
    local zone = player:getZone()
    local varName = arg1

    if varName == nil then
        error(player, "You must provide a variable name.")
        return
    end

    if arg3 == nil then
        targ = player:getCursorTarget()
    elseif arg4 ~= nil then
        local entity_type = string.upper(arg3)
        if (entity_type == 'NPC') or (entity_type == 'MOB') then
            arg4 = tonumber(arg4)
            if zone:getType() == tpz.zoneType.INSTANCED then
                local instance = player:getInstance()
                targ = instance:getEntity(bit.band(arg4, 0xFFF), tpz.objType[entity_type])
            elseif entity_type == 'NPC' then
                targ = GetNPCByID(arg4)
            else
                targ = GetMobByID(arg4)
            end
        elseif entity_type == 'PLAYER' then
            targ = GetPlayerByName(arg4)
        else
            error(player, "Invalid entity type.")
            return
        end
    else
        error(player, "Need to specify a target.")
        return
    end

    if targ == nil then
        error(player, "Invalid target.")
        return
    end

    local varValue = targ:getLocalVar(varName)
    player:PrintToPlayer(string.format("%s's variable '%s' : %i", targ:getName(), varName, varValue))
end
