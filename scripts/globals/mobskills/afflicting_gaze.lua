---------------------------------------------
-- Afflicting Gaze
-- Description: Plagues and Binds opponents with a gaze attack.
-- Type: Gaze
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Conal gaze
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.PLAGUE
	local typeEffect2 = tpz.effect.BIND

    skill:setMsg(MobGazeMove(mob, target, typeEffect1, 5, 0, 30))
	MobGazeMove(mob, target, typeEffect2, 1, 0, 30)
	
    return typeEffect1
end