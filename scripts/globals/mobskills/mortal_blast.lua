---------------------------------------------
-- Mortal Blast
--
-- Description: Unleashes a gaze attack on a single target that inflicts death.
-- Type: Magical (Dark)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.KO

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, 0))
	
	if (target:isFacing(mob)) then
		target:setHP(0)
	end

    return typeEffect
end