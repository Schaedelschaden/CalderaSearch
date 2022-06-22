---------------------------------------------
-- Frenzied Rage
--
-- Description: Attack Boost
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: 20% Attack Boost.
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
    local power = 20
    local duration = 120
	local master = mob:getMaster()
	
	if (master ~= nil) then
		master:addStatusEffect(typeEffect, power, 0, duration)
	end

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration))
	
    return typeEffect
end