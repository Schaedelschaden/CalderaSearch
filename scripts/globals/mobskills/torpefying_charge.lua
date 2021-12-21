---------------------------------------------
-- Torpefying Charge
--
-- Description: Paralyzes enemies in an area of effect.
-- Type: Magical (Ice)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.PARALYSIS

	if (target:isFacing(mob)) then
		skill:setMsg(MobGazeMove(mob, target, typeEffect, 50, 0, 90))
	else
		skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
	end

    return typeEffect
end