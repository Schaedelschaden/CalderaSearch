---------------------------------------------
-- Rinpyotosha
--
-- Description: Grants the effect of Warcry to user and any linked allies.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self and nearby mobs of same family and/or force up to 20'.
-----------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local power    = 25
    local duration = 180

    local typeEffect = tpz.effect.WARCRY
    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration))

    if target:getID() ~= mob:getID() then
        target:addStatusEffect(tpz.effect.WARCRY, 15, 0, duration)
        skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
    end

    return typeEffect
end
