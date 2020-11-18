---------------------------------------------------
-- Soothing Ruby (Carbuncle Blood Pact)
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
	local currentMP = player:getMP()
	local bloodboon = player:getMod(tpz.mod.BLOOD_BOON)
	local cost = 74 -- Set the Blood Pact MP Cost here
		
	if (player:hasStatusEffect(tpz.effect.ASTRAL_CONDUIT)) then
		ability:setRecast(utils.clamp(0, 0, 0))
	end
	
	if (player:hasStatusEffect(tpz.effect.APOGEE)) then
		cost = cost * 1.5
		ability:setRecast(utils.clamp(0, 0, 0))
		player:delStatusEffect(tpz.effect.APOGEE)
	end
	
	if (math.random(1,100) < bloodboon) then
--		local originalcost = cost
		cost = (cost * (math.random(8,16) / 16))
--		printf("Soothing Ruby PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Soothing Ruby PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill)
	printf("Soothing Ruby PET onUseAbility\n")
--	This still needs to be adjusted for skill level, just not sure what that looks like at the moment
--	4 removed for base level 99, 5 removed for 109+, 6 removed for 119+?

	local effect1 = target:eraseStatusEffect()
	local effect2 = target:eraseStatusEffect()
	local effect3 = target:eraseStatusEffect()
	local effect4 = target:eraseStatusEffect()
	local effect5 = target:eraseStatusEffect()
	local effect6 = target:eraseStatusEffect()
	
	skill:setMsg(tpz.msg.basic.NONE) -- Display no message
	
	return effect1, effect2, effect3, effect4, effect5, effect6
end