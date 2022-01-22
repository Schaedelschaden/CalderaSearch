-----------------------------------
-- Ability: Provoke
-- Goads an enemy into attacking you.
-- Obtained: Warrior Level 5
-- Recast Time: 0:30
-- Duration: 30 seconds
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
	if (player:getObjType() == tpz.objType.PC or player:getObjType() == tpz.objType.TRUST) then
		local enmityList = target:getEnmityList()
		local targName = {}
		local targ
		local currentCE

		for i, v in ipairs(enmityList) do
			local reduceCE = 25
			targName[i] = v.entity:getName()
			
			if (v.entity:isPC()) then
				targ = GetPlayerByName(targName[i])
			else
				targ = v.entity
			end
			
			currentCE = target:getCE(targ)
			
			if (currentCE < 26) then
				reduceCE = currentCE - 1
			end

			if (targ:getName() ~= player:getName()) then
				-- printf("provoke.lua onUseAbility [%s] REDUCING [%s's] ENMITY BY [%i] FROM [%i] TO [%i]", player:getName(), targ:getName(), reduceCE, target:getCE(targ), target:getCE(targ) - reduceCE)
				target:setCE(targ, target:getCE(targ) - reduceCE)
			end
		end
	end
end