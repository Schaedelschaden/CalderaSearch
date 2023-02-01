---------------------------------------------
-- Wisecrack
-- Description: Inflicts AOE charm
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.CHARM_I

    if not target:isPC() then
        skill:setMsg(tpz.msg.basic.SKILL_MISS)
        return typeEffect
    end

    local msg = MobStatusEffectMove(mob, target, typeEffect, 0, 3, 60)

    if msg == tpz.msg.basic.SKILL_ENFEEB_IS then
        mob:charm(target)
    end

    if -- ISNM Making a Mockery - Mocking Colibri
        mob:getID() == 17051649 or
        mob:getID() == 17051651 or
        mob:getID() == 17051653
    then
        target:dispelAllStatusEffect()
    end

    skill:setMsg(msg)

    return typeEffect
end
