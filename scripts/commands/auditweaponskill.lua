---------------------------------------------------------------------------------------------------
-- func: !auditweaponskill
-- desc: Toggles the AuditWeaponskill local var on/off and enables/disables the weaponskill system print out
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
	if (player:getLocalVar("AuditWeaponskill") == 0) then
		player:setLocalVar("AuditWeaponskill", 1)
		player:PrintToPlayer(string.format("Weaponskill auditing: [ON]"))
	else
		player:setLocalVar("AuditWeaponskill", 0)
		player:PrintToPlayer(string.format("Weaponskill auditing: [OFF]"))
	end
end