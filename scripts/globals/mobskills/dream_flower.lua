---------------------------------------------
-- Dream Flower
-- 15' AoE sleep
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.SLEEP_I
    local power      = 1
    local tick       = 0
    local duration   = math.random(30, 60)

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, tick, duration))

    return typeEffect
end
