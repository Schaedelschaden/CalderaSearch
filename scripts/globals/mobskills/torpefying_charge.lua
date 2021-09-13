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
    local typeEffect = tpz.effect.PARALYZE

	if (target:isFacing(mob)) then
		skill:setMsg(MobGazeMove(mob, target, typeEffect, 25, 0, 0))
	end

    return typeEffect
end