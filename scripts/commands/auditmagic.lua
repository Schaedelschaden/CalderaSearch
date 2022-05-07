---------------------------------------------------------------------------------------------------
-- func: !auditmagic
-- desc: Toggles the AuditWeaponskill local var on/off and enables/disables the magic system print out
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
	if (player:getLocalVar("AuditMagic") == 0) then
		player:setLocalVar("AuditMagic", 1)
		player:PrintToPlayer(string.format("Magic auditing: [ON]"))
	else
		player:setLocalVar("AuditMagic", 0)
		player:PrintToPlayer(string.format("Magic auditing: [OFF]"))
	end
end