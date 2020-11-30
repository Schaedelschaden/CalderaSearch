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