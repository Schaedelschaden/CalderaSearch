---------------------------------------------------------------------------------------------------
-- func: !checkenmitytrust <target>
-- desc: Checks the target's current enmity when in a party with trusts.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("Type !checkenmitytrust with a mob targeted.")
end

function onTrigger(player, mobId)
    -- validate mobId
    local target
    if (mobId == nil) then
        target = player:getCursorTarget()
        if (target == nil or not target:isMob()) then
            error(player,"You must target a mob.")
            return
        end
    else
        target = GetMobByID(mobId)
        if (target == nil) then
            error(player,"Invalid mobID.")
            return
        end
    end
	
	local enmityList = target:getEnmityList()
	local partyList = player:getPartyWithTrusts()
	
	-- Find all entities currently in a party with the triggering member
	for i,v in ipairs(partyList) do
		local trustName = v:getName()
		local fixedTrustName = string.gsub(" "..trustName, "%W%l", string.upper):sub(2)
		
		if (v:getObjType() == tpz.objType.TRUST) then
			player:PrintToPlayer(string.format("Trust: [%s] CE: %i VE: %i", fixedTrustName, target:getCE(v), target:getVE(v)),tpz.msg.channel.SYSTEM_3)
		end
	end
end