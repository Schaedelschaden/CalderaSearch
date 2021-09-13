---------------------------------------------
--  Sweet Breath
--
--  Description: Deals water damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical Water (Element)
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
	if (mob:getID() == 17957301 or mob:getID() == 17957302) then
		mob:setVE(target, 0)
	end

    local dmgmod = MobBreathMove(mob, target, 0.125, 3, tpz.magic.ele.WATER, 500)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)
	
	local typeEffect = tpz.effect.SLEEP_I
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30)
    
    return dmg
end