---------------------------------------------
--  Arduous Decision
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.SILENCE

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60)

    local dmgmod = MobBreathMove(mob, target, 0.25, 2, tpz.magic.ele.WIND, math.random(600, 1200))

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.WIND, MOBPARAM_IGNORE_SHADOWS)
	
	if (mob:getMainLvl() >= 130) then
		mob:resetEnmity(target)
	else
    
	end

    return dmg
end
