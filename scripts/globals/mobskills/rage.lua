---------------------------------------------
-- Rage
--
-- Description: The Ram goes berserk
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: 25% Attack UP, -25% defense DOWN
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = tpz.effect.BERSERK
	local duration = 60
	local master = mob:getMaster()
	
	if (master ~= nil) then
		master:addStatusEffect(typeEffect, 1, 0, duration)
	end
	
    skill:setMsg(MobBuffMove(mob, typeEffect, 1, 0, duration))
	
    return typeEffect
end