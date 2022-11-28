---------------------------------------------
--  Geotic Spin
--  Description: Deals damage in an area of effect. Additional effect: Petrification and Rasp.
--  Type: Physical
--  Utsusemi/Blink absorb: 2-4 shadows
--  Range: 10' radial
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
    local typeEffect1 = tpz.effect.PETRIFICATION
    local typeEffect2 = tpz.effect.RASP
    local numhits     = math.random(2, 4)
    local accmod      = 1
    local dmgmod      = 2
    local info        = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg         = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)

    MobStatusEffectMove(mob, target, typeEffect1, 1, 0, 60)
    MobStatusEffectMove(mob, target, typeEffect2, 20, 3, 120)

    return dmg
end
