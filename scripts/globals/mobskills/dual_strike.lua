---------------------------------------------
-- Dual Strike
--
-- Family: Xzomit
-- Type: Physical
-- Can be dispelled: N/A
-- Utsusemi/Blink absorb: 2 shadows
-- Range: Melee
-- Notes: Double attacks a single target. Additional effect: Stun
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 2
    local accmod  = 1
    local dmgmod  = 1.5
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.NONE, info.hitslanded)

    local typeEffect = tpz.effect.STUN

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, math.random(4, 6))

    return dmg
end
