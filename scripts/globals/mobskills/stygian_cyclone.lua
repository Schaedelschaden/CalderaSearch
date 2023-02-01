---------------------------------------------
-- Stygian Cyclone
--
-- Description: Deals low damage within an area of effect.
-- Additional Effect: Silence
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 1.75, tpz.magic.ele.DARK, dmgmod, TP_NO_EFFECT)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)

    local typeEffect = tpz.effect.SILENCE

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60)

    return dmg
end
