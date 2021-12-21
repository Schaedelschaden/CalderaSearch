---------------------------------------------
--  Cranial Thrust
--
--  Description: Single target Max HP Down
--  Type: Physical
--  Utsusemi/Blink absorb: 1 Shadow
--  Range: 7
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
    local accmod = 1.5
    local dmgmod = 2.8
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)

    local typeEffect = tpz.effect.MAX_HP_DOWN
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 25, 0, 180)

    return dmg
end