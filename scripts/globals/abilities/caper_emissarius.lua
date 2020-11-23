-----------------------------------
-- Ability: Caper Emissarius
-- Transfers enmity to a party member of your choice.
-- Obtained: Scholar Level 96
-- Recast Time: 1:00:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
	local mob = player:getCursorTarget()
	if (mob:getObjType() == tpz.objType.PC) or (mob == nil) then
		return tpz.msg.basic.CANNOT_ON_THAT_TARG
	else
		return 0,0
	end
end

function onUseAbility(player, target, ability)
	local partyList = player:getParty()
	local MemberName = {}
	local playerCE = {}
	local playerVE = {}
--	local mob = player:getTarget()
	local mob = player:getCursorTarget()
	
	local targ
	local totalCE = 0
	local totalVE = 0
	
	-- Find all players currently in a party with the SCH
	for i,v in ipairs(partyList) do
		MemberName[i] = v:getName()
--		printf("libra.lua onUseAbility PARTY MEMBER %s FOUND", MemberName[i])
	end
	
	-- Record the enmity from every party member then set it to 0
	for i,v in ipairs(MemberName) do
		targ = GetPlayerByName(MemberName[i])
		playerCE[i] = mob:getCE(targ)
		playerVE[i] = mob:getVE(targ)
--		printf("libra.lua onUseAbility Current CE: [%s] Current VE: [%i]", playerCE[i], playerVE[i])
		totalCE = totalCE + playerCE[i]
		totalVE = totalVE + playerVE[i]
		mob:setCE(targ, 0)
		mob:setVE(targ, 0)
--		printf("libra.lua onUseAbility PLAYER NAME: [%s]  PLAYER CE: [%i]  PLAYER VE: [%i]\nTOTAL CE: [%i]  TOTAL VE: [%i]", MemberName[i], playerCE[i], playerVE[i], totalCE, totalVE)
	end
	
	-- 'Transfer' the enmity to the target of the JA
	mob:setCE(target, totalCE)
	mob:setVE(target, totalVE)

    return 0
end