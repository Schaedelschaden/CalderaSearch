---------------------------------------------
-- Heavy Bellow
--
-- Description: Additional effect: "Stun."
-- Type: Physical (Blunt)
--
-- Notes: Minax Bugard resets enmity using a listener in its mob LUA
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.STUN

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 6))

    return typeEffect
end
