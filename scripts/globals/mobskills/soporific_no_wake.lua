---------------------------------------------
-- Soporific (No Wake)
-- 20' AoE sleep
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local dmgmod  = 1
    local info    = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 1.5, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)

    local typeEffect = tpz.effect.SLEEP_I
    local power      = 2 -- Prevent DoT from waking the target
    local tick       = 0
    local duration   = math.random(60, 90)

    MobStatusEffectMove(mob, target, typeEffect, power, tick, duration)

    local effect = target:getStatusEffect(tpz.effect.SLEEP_I)

    -- Prevent taking damage from waking the target
    if effect then
        effect:unsetFlag(tpz.effectFlag.DAMAGE)
    end

    return dmg
end
