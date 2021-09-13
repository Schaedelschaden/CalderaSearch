---------------------------------------------
-- Fluorescence
--
-- Description: Emits radiation to boost next attack.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: Attack increase.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.ATTACK_BOOST
	local duration = 10

    skill:setMsg(MobBuffMove(mob, typeEffect, 100, 0, duration))
	
    return typeEffect
end