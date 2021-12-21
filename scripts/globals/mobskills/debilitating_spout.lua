---------------------------------------------
--  Debilitating Spout
--
--  Description: Conal damage, Knockback & brief Curse(Recovery)
--  Type: Conal/Breath
--  Utsusemi/Blink absorb: Ignore shadows
--  Range: 12
--  Notes: 
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = MobBreathMove(mob, target, 0.3, 0.75, tpz.magic.ele.WATER, 460)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)

    local typeEffect = tpz.effect.CURSE_II

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, 5))

    return dmg
end