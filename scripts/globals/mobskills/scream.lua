---------------------------------------------
-- Scream
-- 15' Reduces MND of players in area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.MND_DOWN
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 10, 3, 120))

	local mobName = mob:getName()
	
	if (mobName == "Chloris" or mobName == "Nightmare_Mandragora") then
		target:addStatusEffect(tpz.effect.TERROR, 1, 0, 10)
	end

    return typeEffect
end