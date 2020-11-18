---------------------------------------------
-- Ability: Conflag Strike (Player Ability)
-- Deals fire elemental damage. Additional effect: Burn.
-- Obtained: Summoner (Ifrit) Level 99
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local currentMP = player:getMP()
	local bloodboon = player:getMod(tpz.mod.BLOOD_BOON)
	local cost = 141 -- Set the Blood Pact MP Cost here
		
	if (player:hasStatusEffect(tpz.effect.ASTRAL_CONDUIT)) then
		ability:setRecast(utils.clamp(0, 0, 0))
	end
	
	if (player:hasStatusEffect(tpz.effect.APOGEE)) then
		cost = cost * 1.5
		ability:setRecast(utils.clamp(0, 0, 0))
		player:delStatusEffect(tpz.effect.APOGEE)
	end
	
	if (math.random(1,100) < bloodboon) then
		local originalcost = cost
		cost = (cost * (math.random(8,16) / 16))
--		printf("Conflag Strike PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Conflag Strike PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill, summoner)
	local dmgmod = MobBreathMove(pet, target, 2.25, 3.50, tpz.magic.ele.FIRE, 10000)
	local dmg = MobFinalAdjustments(dmgmod,pet,skill,target,tpz.attackType.BREATH,tpz.damageType.FIRE,MOBPARAM_IGNORE_SHADOWS)
	
	if (target:hasStatusEffect(tpz.effect.DROWN) == false) then
        target:delStatusEffect(tpz.effect.FROST)
		target:addStatusEffect(tpz.effect.BURN, 30, 0, 90)
    end
	
	target:takeDamage(dmg, pet, tpz.attackType.BREATH, tpz.damageType.FIRE)
	target:updateEnmityFromDamage(pet,damage)
	
	return dmg
end