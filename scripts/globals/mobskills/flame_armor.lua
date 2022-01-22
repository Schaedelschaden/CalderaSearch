---------------------------------------------
-- Flame Armor
--
-- Description: Covers the user in fiery spikes. Enemies that hit it take fire damage.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local power = 50
    local duration = 180
    local typeEffect1 = tpz.effect.BLAZE_SPIKES
	local typeEffect2 = tpz.effect.SHELL
	
	if (mob:getMainLvl() >= 136) then
		skill:setMsg(MobBuffMove(mob, typeEffect1, 200, 0, 300))
		MobBuffMove(mob, typeEffect2, 128, 0, 300)
	else
		skill:setMsg(MobBuffMove(mob, typeEffect1, power, 0, duration))
	end

    -- skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration))

    return typeEffect1
end
