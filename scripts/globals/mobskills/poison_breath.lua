---------------------------------------------
--  Poison Breath
--
--  Description: Deals water damage to enemies within a fan-shaped area originating from the caster. Additional effect: Poison.
--  Type: Magical Water (Element)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.POISON
    local power = math.ceil(mob:getMainLvl() / 5)

	if (mob:getID() == 16941365) then
		local power = math.ceil(mob:getMainLvl() / .5)
	else
		local power = math.ceil(mob:getMainLvl() / 5)
	end
	
	MobStatusEffectMove(mob, target, typeEffect, power, 3, 60)
    local dmgmod = MobBreathMove(mob, target, 0.1, 1.25, tpz.magic.ele.WATER, 1500)

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)
    return dmg
end
