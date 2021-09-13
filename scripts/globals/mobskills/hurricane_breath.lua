---------------------------------------------
--  Hurricane Breath
--
--  Description: Deals wind damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Wind)
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffectOne = tpz.effect.SILENCE

    local dmgmod = MobBreathMove(mob, target, 0.5, 1, tpz.magic.ele.WIND, 1100)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.WIND, MOBPARAM_IGNORE_SHADOWS)

	MobStatusEffectMove(mob, target, typeEffectOne, 1, 0, 60)
	
	local unequipSlot = math.random(0, 15)
	
	target:unequipItem(unequipSlot)

    return dmg
end