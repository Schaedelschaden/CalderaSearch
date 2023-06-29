---------------------------------------------
--  Ruinous Scythe
--
--  Description: Deals damage in a fourfold attack. Additional effect: HP Down
--  Type: Physical
--  Utsusemi/Blink absorb: 4 shadows
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
    local numhits = 4
    local accmod  = 1
    local dmgmod  = 1.7
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)

    local typeEffect1 = tpz.effect.MAX_HP_DOWN
    local typeEffect2 = tpz.effect.STUN
    local power      = math.random(30, 99)

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect1, power, 0, 60)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect2, 1, 0, 6)

    return dmg
end
