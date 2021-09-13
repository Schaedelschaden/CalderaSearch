---------------------------------------------
--  Canopierce
--
--  Description: Deals severe Earth damage to enemies within an area of effect. Additional effect: Rasp
--  Type:  Magical

---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.RASP
    local power = 85

    MobStatusEffectMove(mob, target, typeEffect, power, 3, 60)

    local dmgmod = 1.85
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*6, tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)
	
    return dmg
end