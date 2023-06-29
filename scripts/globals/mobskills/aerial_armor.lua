---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if target:getObjType() ~= tpz.objType.MOB then
        target:addStatusEffect(tpz.effect.BLINK, 8, 0, 320)
        skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
        
        return tpz.effect.BLINK
    else
        local typeEffect = tpz.effect.BLINK

        skill:setMsg(MobBuffMove(mob, typeEffect, 3, 0, 180))

        return typeEffect
    end
end
