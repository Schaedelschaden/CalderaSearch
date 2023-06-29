---------------------------------------------
-- Stygian Sphere
--
-- Description: Heals self for 1,800-2,000+ HP.
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local potency = math.random(5000, 10000)

    if
        mob:getID() == 16961945 -- Iratham
    then
        mob:addStatusEffect(tpz.effect.MAGIC_SHIELD, 2, 0, 0)
    elseif
        mob:getID() == 17658292 -- Yaanei
    then
        local numEffects = math.random(1, 5)

        for i = 1, numEffects do
            mob:eraseStatusEffect()
        end
    elseif
        mob:getID() == 17670551 or -- Rani
        mob:getID() == 17670555 or -- Rani
        mob:getID() == 17670559 or -- Rani
        mob:getID() == 17818051 or -- Raja
        mob:getID() == 17818055 or -- Raja
        mob:getID() == 17818059    -- Raja
    then
        mob:addStatusEffect(tpz.effect.STONESKIN, potency / 2, 0, 180)
    end

    skill:setMsg(tpz.msg.basic.SELF_HEAL)

    return MobHealMove(mob, potency)
end
