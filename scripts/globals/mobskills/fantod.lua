---------------------------------------------
-- Fantod
--
-- Description: Enhances attacks. Duration of effect varies with TP.
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
	local duration = 90
	local master = mob:getMaster()
	local tp = mob:getTP()
	
	if (master ~= nil and tp > 1000 and tp <= 2000) then
		duration = 120
	elseif (master ~= nil and tp > 2000 and tp <= 3000) then
		duration = 180
	end

    skill:setMsg(MobBuffMove(mob, typeEffect, 25, 0, duration))
	
    return typeEffect
end