---------------------------------------------
-- Earthen Ward
-- Titan grants Stoneskin to party members within area of effect.
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
        target:addStatusEffect(tpz.effect.STONESKIN, 1500, 0, 320)
        skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
        
        return tpz.effect.STONESKIN
    else
        local typeEffect = tpz.effect.STONESKIN
        local base = mob:getMainLvl()*2 + 50
        
        -- Adjust Trial By Earth Titan's Earthen Ward damage
        if (mob:getID() == 17633281) then
            base = 1500
        end

        skill:setMsg(MobBuffMove(mob, typeEffect, base, 0, 180))

        return tpz.effect.STONESKIN
    end
end
