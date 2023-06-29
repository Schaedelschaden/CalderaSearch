---------------------------------------------
--  Charge Horn (Monoceros buff ability)
--
--  Type: Enhancement
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:getLocalVar("MONOCEROS_CHARGE_HORN") < 3 then
        return 1
    else
        return 0
    end
end

function onMobWeaponSkill(target, mob, skill)
    if mob:AnimationSub() == 0 then
        -- Horn is intact, generate a charge
        local currentCharge = mob:getLocalVar("MONOCEROS_CHARGE_HORN")

        mob:setLocalVar("MONOCEROS_CHARGE_HORN", currentCharge + 1)
    elseif mob:AnimationSub() == 2 then
        -- Horn is broken, try to regenerate horn
        local chance = math.random(0, 100)

        if chance <= 20 then
            mob:AnimationSub(0)
        end
    end

    -- tpz.msg.basic.STATUS_INCREASED -- If a message alerting players to the charge is desired
    skill:setMsg(tpz.msg.basic.NONE)

    return dmg
end
