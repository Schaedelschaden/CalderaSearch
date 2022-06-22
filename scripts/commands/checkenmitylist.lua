---------------------------------------------------------------------------------------------------
-- func: !checkenmitylist <target>
-- desc: Checks the target's current enmity list.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("Type !checkenmitylist with a mob targeted.")
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
	local targName = {}
	local targ
	local currentCE
	local currentVE

	for i, v in ipairs(enmityList) do
		targName[i] = v.entity:getName()
		
		if (v.entity:isPC()) then
			targ = GetPlayerByName(targName[i])
		else
			targ = v.entity
		end

		currentCE = target:getCE(targ)
		currentVE = target:getVE(targ)

		player:PrintToPlayer(string.format("CheckEnmitylist ENTRY: [%i]  NAME: [%s]  CURRENT CE: [%i]  CURRENT VE: [%i]", i, targName[i], currentCE, currentVE),tpz.msg.channel.SYSTEM_3)
	end
end