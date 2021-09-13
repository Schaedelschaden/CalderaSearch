---------------------------------------------
--  Thousand Spears
--
--  Description: Deals damage in an area. Additional effect: Amnesia (if not blocked by shadows)
--  Type: Physical
--  Utsusemi/Blink absorb: 2 shadows
--  Range: 10
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
    local typeEffect = tpz.effect.AMNESIA
    local numhits = 1
    local accmod = 2
    local dmgmod = 2
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local shadows = MOBPARAM_2_SHADOW

    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, shadows)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 30)
    
    return dmg
end