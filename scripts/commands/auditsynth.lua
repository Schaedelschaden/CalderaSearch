---------------------------------------------------------------------------------------------------
-- func: !auditsynth
-- desc: Toggles the AuditSynth local var on/off and enables/disables the Audit Synthesis system print out
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
	if player:getLocalVar("AuditSynth") == 0 then
		player:setLocalVar("AuditSynth", 1)
		player:PrintToPlayer(string.format("Synthesis auditing: [ON]"))
	elseif player:getLocalVar("AuditSynth") == 1 then
		player:setLocalVar("AuditSynth", 0)
		player:PrintToPlayer(string.format("Synthesis auditing: [OFF]"))
	end
end
