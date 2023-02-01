---------------------------------------------
-- Seaspray
--
-- Description: Cone Attack Water damage + Slow (overwrites Haste).
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.SLOW
    local dmgmod     = 3
    local info       = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 2.5, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT)
    local dmg        = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)

    MobStatusEffectMove(mob, target, typeEffect, 3000, 0, 120)

    return dmg
end
