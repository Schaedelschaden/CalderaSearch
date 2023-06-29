---------------------------------------------
-- healing_ruby II
--
-- Description: Restores HP.
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
    if target:getObjType() ~= tpz.objType.MOB then
        local base = (target:getMaxHP() / 4) + (target:getMainLvl() * 2)
        local power = target:getMainLvl() / 4
        if (target:getHP()+base > target:getMaxHP()) then
            base = target:getMaxHP() - target:getHP() --cap it
        end
        
        target:addStatusEffect(tpz.effect.REGEN, power, 0, 30)
        skill:setMsg(tpz.msg.basic.SELF_HEAL_SECONDARY)
        target:addHP(base)
        
        return base
    else
        local potency = skill:getParam()

        if (potency == 0) then
            potency = 25
        end

        potency = potency - math.random(0, potency/4)

        skill:setMsg(tpz.msg.basic.SELF_HEAL)

        return MobHealMove(mob, mob:getMaxHP() * potency / 100)
    end
end
