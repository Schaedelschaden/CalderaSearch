---------------------------------------------------------------------------------------------------
-- func: !auditfastcast
-- desc: Toggles the AuditCastTime local var on/off and enables/disables the fast cast system print out
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
	if player:getLocalVar("AuditCastTime") == 0 then
		player:setLocalVar("AuditCastTime", 1)
		player:PrintToPlayer(string.format("Magic cast time auditing: [ON]"))
	else
		player:setLocalVar("AuditCastTime", 0)
		player:PrintToPlayer(string.format("Magic cast time auditing: [OFF]"))
	end
end
