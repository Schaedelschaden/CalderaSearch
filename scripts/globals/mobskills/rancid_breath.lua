---------------------------------------------
--  Rancid Breath
--
--  Description: Deals heavy damage in an area of effect. Additional effect: Terror
--  Type: BREATH
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 15' Radial
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.TERROR
    local duration   = math.random(4, 8)
    local numhits    = 1
    local accmod     = 1
    local dmgmod     = 7
    local info       = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg        = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.BLUNT, MOBPARAM_IGNORE_SHADOWS)

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, duration)

    return dmg
end
