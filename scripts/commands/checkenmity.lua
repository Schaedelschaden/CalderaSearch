---------------------------------------------------------------------------------------------------
-- func: !checkenmity <target>
-- desc: Checks the target's current enmity.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("Type !checkenmity with a mob targeted.")
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
	local allianceList = player:getAlliance()
	local MemberName = {}
	local PlayerName = {}
	local Report = {}
	local playerCE = {}
	local playerVE = {}
	
	local targ
	local totalCE = 0
	local totalVE = 0
	
	-- Find all players on the monster's enmity list
	for i,v in ipairs(enmityList) do		
		PlayerName[i] = v.entity:getName()
	end
	
	-- Find all players currently in an alliance with the triggering member
	for i,v in ipairs(allianceList) do
		MemberName[i] = v:getName()
	end
	
	-- Compare the list of alliance members to the enmity list
	for i,v in ipairs(MemberName) do
		if (v == MemberName[i]) then
			Report[i] = MemberName[i]
		end
	end
	
	-- Total the CE/VE for all alliance members to provide our divisor
	-- Divide the player's CE/VE by the total CE/VE to determine the ratio then multiply by 100 to create a percentage
	-- Print what the alliance's percentage of Enmity is
	for i,v in ipairs(Report) do
		targ = GetPlayerByName(Report[i])
		playerCE[i] = target:getCE(targ)
		playerVE[i] = target:getVE(targ)

		totalCE = totalCE + playerCE[i]
		totalVE = totalVE + playerVE[i]
	end
	
	for i,v in ipairs(Report) do
		if (Report[i] ~= nil) then
			player:PrintToPlayer(string.format("%s's Cumulative Enmity: %i (%i%%) Volatile Enmity: %i (%i%%)", Report[i], playerCE[i], (playerCE[i] / totalCE) * 100, playerVE[i], (playerVE[i] / totalVE) * 100),tpz.msg.channel.SYSTEM_3)
		end
	end
end