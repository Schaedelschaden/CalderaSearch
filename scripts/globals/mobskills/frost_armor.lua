---------------------------------------------
-- Frost Armor (Shiva Blood Pact)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if target:getObjType() ~= tpz.objType.MOB then
        target:addStatusEffect(tpz.effect.ICE_SPIKES, 13, 0, 320)
        skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
        
        return tpz.effect.ICE_SPIKES
    else
        local power = 10
        local duration = 180
        local typeEffect = tpz.effect.ICE_SPIKES

        skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration))

        return typeEffect
    end
end
