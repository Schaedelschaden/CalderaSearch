---------------------------------------------
--  Wings of Gehenna
--
--  Description: Deals damage to players in an area of effect.
--  Additional effect: Knockback & Stun
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown radial
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
    local dmgmod = 1
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, tpz.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_WIPE_SHADOWS)

    local typeEffect = tpz.effect.STUN

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 4)

    if mob:getHPP() <= 33 and math.random(0, 100) <= 33 then
        mob:resetEnmity(target)
    end

    return dmg
end
