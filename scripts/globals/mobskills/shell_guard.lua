---------------------------------------------
-- Shell Guard
-- Increases defense of user.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local base = 100
    -- local typeEffect = tpz.effect.DEFENSE_BOOST
	
	local typeEffect1 = tpz.effect.DEFENSE_BOOST
	local typeEffect2 = tpz.effect.SHELL
	
	if (mob:getMainLvl() >= 130) then
		skill:setMsg(MobBuffMove(mob, typeEffect1, 50, 0, 300))
		MobBuffMove(mob, typeEffect2, 120, 0, 300)
	else
		skill:setMsg(MobBuffMove(mob, typeEffect1, 100, 0, 300))
	end
	
    -- skill:setMsg(MobBuffMove(mob, typeEffect, base, 0, 180))
    return typeEffect1
end
