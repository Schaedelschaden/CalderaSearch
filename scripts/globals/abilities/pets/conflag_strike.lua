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
	return 0,0
end

function onPetAbility(target, pet, skill)
	local cap = math.random(1500, 2000) * (1 + (pet:getMod(tpz.mod.PET_BREATH) / 100))

	local dmgmod = MobBreathMove(pet, target, 2.00, 3.25, tpz.magic.ele.FIRE, math.random(1500, 2000))
	local dmg = MobFinalAdjustments(dmgmod,pet,skill,target,tpz.attackType.BREATH,tpz.damageType.FIRE,MOBPARAM_IGNORE_SHADOWS)
	
	if (target:hasStatusEffect(tpz.effect.DROWN) == false) then
        target:delStatusEffect(tpz.effect.FROST)
		target:addStatusEffect(tpz.effect.BURN, 30, 0, 90)
    end
	
	target:takeDamage(dmg, pet, tpz.attackType.BREATH, tpz.damageType.FIRE)
	target:updateEnmityFromDamage(pet,damage)
	
	return dmg
end