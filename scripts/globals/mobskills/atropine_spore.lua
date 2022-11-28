---------------------------------------------
-- Atropine Spore
-- Description: Inflicts damage. Additional effect: sleep, paralyze, and silence
-- Type: Magical (Ice)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2.25
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.ICE, dmgmod, TP_NO_EFFECT)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ICE, MOBPARAM_WIPE_SHADOWS)

    target:addStatusEffect(tpz.effect.PARALYSIS, 30, 0, 180)
    target:addStatusEffect(tpz.effect.SLEEP_I, 1, 0, 60)
    target:addStatusEffect(tpz.effect.SILENCE, 1, 0, 180)

    return dmg
end
