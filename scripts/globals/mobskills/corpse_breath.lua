---------------------------------------------
-- Corpse Breath
-- Description: Deals damage in a frontal fan-shaped area. Additional effect: Blindness
-- Type: Magical
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = MobBreathMove(mob, target, 0.2, 0.75, tpz.magic.ele.NONE, 700)

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.NONE, MOBPARAM_IGNORE_SHADOWS)
	
	MobStatusEffectMove(mob, target, tpz.effect.BLINDNESS, 100, 0, 60)
	
    return dmg
end