---------------------------------------------
--  Sticky Situation
--
--  Description: Deals dark damage that inflicts multiple status ailments on enemies within a radial area originating from the caster.
--  Type: Magical (Dark)
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.DARK, dmgmod, TP_NO_EFFECT)
    local dmg  = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)

    MobStatusEffectMove(mob, target, tpz.effect.SILENCE, 1, 0, 30)
    MobStatusEffectMove(mob, target, tpz.effect.SLOW, 1500, 0, 60)
    MobStatusEffectMove(mob, target, tpz.effect.PLAGUE, 50, 0, 60)

    return dmg
end
