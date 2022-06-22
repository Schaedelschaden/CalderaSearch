---------------------------------------------
--  Cold Wave
--
--  Description: Deals ice damage that lowers Agility and gradually reduces HP of enemies within range.
--  Additional effect: Frost
--  Type: Magical (Ice)
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.FROST

    local power = (mob:getMainLvl()/5 *.6 + 6)
	local dmgmod = 1
	
	if (mob:getLocalVar("MOBSKILL_INCREASED_POTENCY") > 0) then
		power = (mob:getMainLvl() *.6 + 6)
		dmgmod = mob:getLocalVar("MOBSKILL_INCREASED_POTENCY")
	end

    MobStatusEffectMove(mob, target, typeEffect, power, 3, 60)

    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 2.8, tpz.magic.ele.ICE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ICE, MOBPARAM_IGNORE_SHADOWS)
	
    return dmg
end