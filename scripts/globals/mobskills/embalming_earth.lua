---------------------------------------------
--  Embalming Earth
--
--  Description: AoE earth damage & Slow
--  Type: Magical AoE
--  Utsusemi/Blink absorb: Wipe shadows
--  Range: 15
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
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)

    local typeEffect = tpz.effect.SLOW
    local power = 3000

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, 180))

    return dmg
end