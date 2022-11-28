---------------------------------------------------
-- Caudal Capacitor
--
-- Description: Inflicts damage and Stun
-- Type: Physical (Blunt)
-- Utsusemi/Blink absorb: 
-- Range: Unknown
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod  = 1
    local dmgmod  = 2.25
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)

    MobStatusEffectMove(mob, target, tpz.effect.STUN, 1, 0, math.random(5, 7))

    return dmg
end
