---------------------------------------------
--  Vitriolic Spray
--  Family: Wamouracampa
--  Description: Expels a caustic stream at targets in a fan-shaped area of effect. Additional effect: Burn
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadow
--  Range: Cone
--  Notes: Burn is 10-30/tic
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BURN
    local power = math.random(10, 30)

    MobStatusEffectMove(mob, target, typeEffect, power, 3, 60)

    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*2.7, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_WIPE_SHADOWS)
    return dmg
end
