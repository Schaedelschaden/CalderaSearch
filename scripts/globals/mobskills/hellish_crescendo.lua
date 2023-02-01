---------------------------------------------
--  Hellish Crescendo
--  Family: Caturae
--  Description: Deals Low to Moderate damage within an area of effect. Additional Effect: Paralyze.
--  Type: Magical (Dark)
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Radial
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
    local dmgmod  = 1
    local info    = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 2, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)

    MobStatusEffectMove(mob, target, tpz.effect.PARALYSIS, 45, 0, 60)

    return dmg
end
