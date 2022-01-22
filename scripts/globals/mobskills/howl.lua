---------------------------------------------
-- Howl
--
-- Description: Grants the effect of Warcry to user and any linked allies.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self and nearby mobs of same family and/or force up to 20'.
-----------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local power = 25
    local duration = 300

    local typeEffect1 = tpz.effect.WARCRY
	local typeEffect2 = tpz.effect.MAGIC_ATK_BOOST
	
	if (mob:getMainLvl() >= 136) then
		skill:setMsg(MobBuffMove(mob, typeEffect1, 50, 0, duration))
		MobBuffMove(mob, typeEffect2, 200, 0, 300)
	else
		skill:setMsg(MobBuffMove(mob, typeEffect1, power, 0, duration))
	end
	
    -- skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration))

    return typeEffect1
end
