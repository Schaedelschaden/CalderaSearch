---------------------------------------------
-- Frenzy Pollen
--
-- Description: Simulates Hundred Fists.
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = tpz.effect.HUNDRED_FISTS
	
    skill:setMsg(MobBuffMove(mob, typeEffect, 1, 0, 60))

    return typeEffect
end