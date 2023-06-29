---------------------------------------------
-- Scream
-- Range: 18'
-- Reduces MND of players in area of effect.
-- Additional effect: Terror
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

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 25, 3, 120))

    target:addStatusEffect(tpz.effect.TERROR, 1, 0, 10)

    return typeEffect
end
