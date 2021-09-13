---------------------------------------------
-- Chthonian Ray
--
-- Description: Inflicts Doom upon in a conal AoE.
-- Type: Magical (Dark)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.DOOM

	if (target:isFacing(mob)) then
		skill:setMsg(MobStatusEffectMove(mob, target, 0.2, 0.75, typeEffect, 10, 3, 30))
	end

    return typeEffect
end