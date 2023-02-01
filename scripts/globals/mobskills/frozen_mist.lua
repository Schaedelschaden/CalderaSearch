-----------------------------------
--  Frozen Mist
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
-----------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.TERROR

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30)

    local dmgmod = MobBreathMove(mob, target, 0.333, 0.625, tpz.magic.ele.ICE, 1500)
    local dmg    = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.ICE, MOBPARAM_IGNORE_SHADOWS)

    return dmg
end
