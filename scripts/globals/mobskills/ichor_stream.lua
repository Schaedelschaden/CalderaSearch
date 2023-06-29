---------------------------------------------
-- Ichor Stream
-- Family: Hpemde
-- Description: Spews venomous ichor at targets in a fan-shaped area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Cone
-- Notes: Poison is about 5/tic.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.POISON
    local power      = 5

    if mob:isNM() then
        power = mob:getHPP()

        if power < 30 then
            power = 30
        end
    end

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, 120))

    return typeEffect
end
