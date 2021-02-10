---------------------------------------------
-- Harden Shell
--
-- Description: Enhances defense.
-- Type: Magical (Earth)
--
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.DEFENSE_BOOST
	local master = mob:getMaster()
	
	if (master ~= nil) then
		master:addStatusEffect(typeEffect, 100, 0, 60)
	end

    skill:setMsg(MobBuffMove(mob, typeEffect, 100, 0, 60))
    return typeEffect
end