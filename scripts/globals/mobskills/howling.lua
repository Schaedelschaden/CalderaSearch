---------------------------------------------
-- Howling
--
-- Description: Paralyzes enemies in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 10' radial
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
    local typeEffect = tpz.effect.PARALYSIS
	local power = 20
	
	if (mob:isNM() and mob:getLocalVar("MOBSKILL_INCREASED_POTENCY") == 1) then
		power = 50
	end
	
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, 60))

    return typeEffect
end