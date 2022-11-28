---------------------------------------------
-- Deractinator
-- Description: Inflicts damage. Additional effect: Amnesia, Blind, and Muddle
-- Type: Magical (Fire)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2.0
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 5, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_WIPE_SHADOWS)

    target:addStatusEffect(tpz.effect.AMNESIA, 1, 0, 30)
    target:addStatusEffect(tpz.effect.BLINDNESS, 50, 0, 180)
    target:addStatusEffect(tpz.effect.MUDDLE, 1, 0, 60)

    return dmg
end
