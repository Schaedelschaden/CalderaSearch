---------------------------------------------
-- Ultrasonics
-- Reduces evasion of targets in area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.EVASION_DOWN

	if mob:getMainLvl() >= 120 then
		skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 150, 0, 180))
	else
		skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 50, 0, 180))
	end

    return typeEffect
end
