---------------------------------------------
-- Hard Membrane
--
-- Description: Enhances evasion.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: Very sharp evasion increase.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.EVASION_BOOST
	local typeEffect2 = tpz.effect.HASTE
	
	if (mob:getMainLvl() >= 130) then
		skill:setMsg(MobBuffMove(mob, typeEffect1, 200, 0, 180))
		MobBuffMove(mob, typeEffect2, 2500, 0, 300)
	else
		skill:setMsg(MobBuffMove(mob, typeEffect1, 25, 0, 60))
	end

    -- skill:setMsg(MobBuffMove(mob, typeEffect, 25, 0, 60))

    return typeEffect1
end