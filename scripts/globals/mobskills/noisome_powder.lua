---------------------------------------------
-- Noisome Powder
-- Reduces attack of targets in area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- Only used during daytime
    local currentTime = VanadielHour()

    if currentTime >= 6 and currentTime <= 18 then
        return 0
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.ATTACK_DOWN

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 40, 0, 120))

    return typeEffect
end
