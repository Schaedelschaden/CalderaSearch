---------------------------------------------
--  Viscous Deluge
--
--  Description: Applies Bio and other debuffs.
--  Type: Magical (Earth)
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

    MobStatusEffectMove(mob, target, tpz.effect.SLOW, 1250, 0, 60)
    MobStatusEffectMove(mob, target, tpz.effect.BIO, mob:getMainLvl() / 10, 3, 60)
    MobStatusEffectMove(mob, target, tpz.effect.SILENCE, 1, 0, 60)
    MobStatusEffectMove(mob, target, tpz.effect.PARALYSIS, 15, 0, 60)
    MobStatusEffectMove(mob, target, tpz.effect.BIND, 1, 0, 30)
    MobStatusEffectMove(mob, target, tpz.effect.BLINDNESS, 30, 0, 60)
    MobStatusEffectMove(mob, target, tpz.effect.WEIGHT, 50, 0, 60)

    skill:setMsg(tpz.msg.basic.MULTIPLE_ENFEEBLE)

    return 7
end
