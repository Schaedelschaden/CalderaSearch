---------------------------------------------
-- Tepal Twist
--
-- Description: Inflicts Max HP Down, growing more powerful with lower HP.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.MAX_HP_DOWN
	local hpp = mob:getHPP()
	local power = 30 + ((100 - hpp) / 5)

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, 60))

    return typeEffect
end