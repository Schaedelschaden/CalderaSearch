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

    MobStatusEffectMove(mob, target, tpz.effect.SILENCE, 1, 0, 30)
    MobStatusEffectMove(mob, target, tpz.effect.SLOW, 15, 0, 60)
    MobStatusEffectMove(mob, target, tpz.effect.PLAGUE, 50, 0, 60)

    local dmgmod = MobMagicMove(mob, target, 0.15, 3, tpz.magic.ele.DARK, 500)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.MAGIC, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)
    
    return dmg
end