---------------------------------------------
--  Shadow Burst
--  Family: Gargouille
--  Description: Deals dark damage to enemies in an area of effect.
--  Type: Magical (dark)
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Radial
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
    local numhits = 1
    local dmgmod  = 1.5
    local info    = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 10, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)

    MobStatusEffectMove(mob, target, tpz.effect.CURSE_I, 50, 0, 300)

    return dmg
end
