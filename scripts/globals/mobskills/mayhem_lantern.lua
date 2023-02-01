---------------------------------------------
-- Mayhem Lantern
-- Family: Orobon
-- Description: Attempts to charm targets in an area of effect. Additional effect: Shock + Attack Boost.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: AoE 10'
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:AnimationSub() == 0 then
        return 0
    else   
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.CHARM_I
    local power      = 0

    if not target:isPC() then
        skill:setMsg(tpz.msg.basic.SKILL_MISS)

        return typeEffect
    end

    local msg = MobStatusEffectMove(mob, target, typeEffect, power, 3, 60)

    if msg == tpz.msg.basic.SKILL_ENFEEB_IS then
        mob:charm(target)
    end

    skill:setMsg(msg)

    target:addStatusEffect(tpz.effect.SHOCK, 30, 3, 60)
    target:addStatusEffect(tpz.effect.ATTACK_BOOST, 50, 0, 60)

    return typeEffect
end
