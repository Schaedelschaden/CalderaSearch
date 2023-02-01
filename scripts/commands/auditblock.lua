---------------------------------------------------------------------------------------------------
-- func: !auditblock
-- desc: Toggles the AuditBlock local var on/off and enables/disables the Block system print out
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
	if player:getLocalVar("AuditBlock") == 0 then
		player:setLocalVar("AuditBlock", 1)
		player:PrintToPlayer(string.format("Shield Block auditing: [ON]"))
	elseif player:getLocalVar("AuditBlock") == 1 then
		player:setLocalVar("AuditBlock", 0)
		player:PrintToPlayer(string.format("Shield Block auditing: [OFF]"))
	end
end
