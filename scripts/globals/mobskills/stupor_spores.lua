---------------------------------------------
-- Stupor Spores
--
-- Description: Spreads intoxicating spores that damages nearby targets.
-- Additional effect: Sleep
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 15' radial
-- Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, tpz.magic.ele.DARK, dmgmod, TP_NO_EFFECT)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)

    local typeEffect = tpz.effect.SLEEP_I

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60)

    return dmg
end
