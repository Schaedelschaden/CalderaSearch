---------------------------------------------
-- Subsonics
-- Lower defense
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.DEFENSE_DOWN

	if mob:getMainLvl() >= 120 then
		skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 150, 0, 180))
	else
		skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 50, 0, 180))
	end

	return typeEffect
end
