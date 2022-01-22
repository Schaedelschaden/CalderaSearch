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
    local typeEffect1 = tpz.effect.DEFENSE_BOOST
	local typeEffect2 = tpz.effect.REGEN
	local master = mob:getMaster()
	
	if (master ~= nil) then
		master:addStatusEffect(typeEffect, 100, 0, 60)
	end
	
	
	if (mob:getMainLvl() >= 136) then
		skill:setMsg(MobBuffMove(mob, typeEffect1, 150, 0, 300))
		MobBuffMove(mob, typeEffect2, 2000, 0, 300)
	else
		skill:setMsg(MobBuffMove(mob, typeEffect1, 100, 0, 60))
	end

    -- skill:setMsg(MobBuffMove(mob, typeEffect, 100, 0, 60))
    return typeEffect1
end