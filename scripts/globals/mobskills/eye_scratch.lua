---------------------------------------------
--  Eye Scratch
--
--  Description: Scratches a single target right in the eyes. Additional effect: Blind
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
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
    local accmod = 1
    local dmgmod = 2.2
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)

    local typeEffect = tpz.effect.BLINDNESS

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 15, 0, 120)

    return dmg
end
