---------------------------------------------
--  Deathly Diminuendo
--  Family: Caturae
--  Description: Deals Low to Moderate damage within an area of effect. Additional Effects: Bio and Curse.
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

    MobStatusEffectMove(mob, target, tpz.effect.CURSE_I, 25, 0, 180)
    MobStatusEffectMove(mob, target, tpz.effect.BIO, 35, 3, 180)

    return dmg
end
