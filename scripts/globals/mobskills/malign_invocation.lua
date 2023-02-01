---------------------------------------------
--  Malign Invocation
--  Family: Caturae
--  Description: Deals Moderate to High damage within an area of effect. Additional Effect: Amnesia.
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
    local info    = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4.5, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)

    MobStatusEffectMove(mob, target, tpz.effect.AMNESIA, 1, 0, math.random(30, 45))

    return dmg
end
