---------------------------------------------
-- Darkest Hour
---------------------------------------------
require("scripts/globals/msg")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.SJ_RESTRICTION
    if target:getObjType() == tpz.objType.PC then
        target:addStatusEffect(typeEffect, 0, 0, 30)
    end
    skill:setMsg(tpz.msg.basic.SKILL_ENFEEB)
    
    return typeEffect
end
