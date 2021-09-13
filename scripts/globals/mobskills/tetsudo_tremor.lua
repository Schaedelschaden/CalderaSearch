---------------------------------------------
--  Tetsudo Tremor
--
--  Description: AoE high earth-based damage, with additional effect: Stun & Gravity.
--  Type: Magical
--  Utsusemi/Blink: Wipes Shadows
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
    local typeEffect1 = tpz.effect.STUN
    local typeEffect2 = tpz.effect.GRAVITY
	
    MobStatusEffectMove(mob, target, typeEffect1, 1, 0, math.random(5, 8))
    MobStatusEffectMove(mob, target, typeEffect2, 50, 0, 90)
	
    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * math.random(4, 6), tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)

    return dmg
end