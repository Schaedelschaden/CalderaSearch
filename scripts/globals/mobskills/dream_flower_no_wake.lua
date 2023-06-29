---------------------------------------------
-- Dream Flower
-- 18' AoE sleep
-- Prevents damage and DoT's from waking the target
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

    -- Prevent DoT from waking the target when mob is below 50% HP
    if mob:getHPP() <= 50 then
        power = 2
    end

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, tick, duration))

    local effect = target:getStatusEffect(tpz.effect.SLEEP_I)

    -- Prevent taking damage from waking the target
    if effect then
        effect:unsetFlag(tpz.effectFlag.DAMAGE)
    end

    -- Nonno
    if mob:getID() == 17662473 then
        mob:resetEnmity(target)
    end

    return typeEffect
end
