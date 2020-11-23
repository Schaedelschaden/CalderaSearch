-----------------------------------
-- Ability: Libra
-- Examines the target's enmity level.
-- Obtained: Scholar Level 76
-- Recast Time: 1:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
	if (target:getAnimation() ~= 1) then
        return tpz.msg.basic.REQUIRES_COMBAT,0
	else
		return 0,0
	end
end

function onUseAbility(player, target, ability)
	local enmityList = target:getEnmityList()
	local partyList = player:getParty()
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
			-- printf("libra.lua onUseAbility ENMITY LIST %s FOUND", PlayerName[i])
	end
	
	-- Find all players currently in a party with the SCH
	for i,v in ipairs(partyList) do
		MemberName[i] = v:getName()
		-- printf("libra.lua onUseAbility PARTY MEMBER %s FOUND", MemberName[i])
	end
	
	-- Compare the list of party members to the enmity list
	for i,v in ipairs(MemberName) do
		if (v == MemberName[i]) then
			Report[i] = MemberName[i]
			-- printf("libra.lua onUseAbility PARTY MEMBER %s CONFIRMED", Report[i])
		end
	end
	
	-- Total the CE/VE for all party members to provide our divisor
	-- Divide the player's CE/VE by the total CE/VE to determine the ratio then multiply by 100 to create a percentage
	-- Print what the party's percentage of Enmity is
	for i,v in ipairs(Report) do
		targ = GetPlayerByName(Report[i])
		playerCE[i] = target:getCE(targ)
		playerVE[i] = target:getVE(targ)
--		printf("libra.lua onUseAbility Current CE: [%s] Current VE: [%i]", playerCE[i], playerVE[i])
		totalCE = totalCE + playerCE[i]
		totalVE = totalVE + playerVE[i]
--		printf("libra.lua onUseAbility TOTAL CE: [%i]  TOTAL VE: [%i]", totalCE, totalVE)
		if (Report[i] ~= nil) then
--			printf("libra.lua onUseAbility PLAYER NAME: [%s]  PLAYER CE: [%i]  PLAYER VE: [%i]\nTOTAL CE: [%i]  TOTAL VE: [%i]", Report[i], playerCE[i], playerVE[i], totalCE, totalVE)
			playerCE[i] = (playerCE[i] / totalCE) * 100
			playerVE[i] = (playerVE[i] / totalVE) * 100
			player:PrintToPlayer(string.format("%s's Cumulative Enmity: %i%% Volatile Enmity: %i%%", Report[i], playerCE[i], playerVE[i]),tpz.msg.channel.SYSTEM_3)
		end
	end

    return 0
end