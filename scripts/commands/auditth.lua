---------------------------------------------------------------------------------------------------
-- func: !auditth
-- desc: Toggles the AuditTH local var on/off and enables/disables the Treasure Hunter system print out
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!setlocalvar <variable name> <value> {'player', 'mob', or 'npc'} {name or ID}")
end

function onTrigger(player)
    local targ = player:getCursorTarget()

    if
        not targ or
        targ:getObjType() ~= tpz.objType.MOB
    then
        player:PrintToPlayer("You must target a monster for this command!")
        return
    end

	if targ:getLocalVar("AuditTH") == 0 then
		targ:setLocalVar("AuditTH", 1)
		player:PrintToPlayer(string.format("Treasure Hunter auditing: [ON]"))
	elseif targ:getLocalVar("AuditTH") == 1 then
		targ:setLocalVar("AuditTH", 0)
		player:PrintToPlayer(string.format("Treasure Hunter auditing: [OFF]"))
	end
end
