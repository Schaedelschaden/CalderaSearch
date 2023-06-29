---------------------------------------------
-- Rejuvenation
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local hp      = target:getMaxHP() / math.random(4, 10)
    local mp      = target:getMaxMP() / math.random(4, 10)
    local cap     = hp - target:getHP()
    local potency = mob:getMainLvl() / 4
    local heal
    
    heal = hp 
    if mob:getObjType() == tpz.objType.MOB then
        heal = mob:getMaxHP() * 0.05
    end
    
    if heal > target:getMaxHP() - target:getHP() then
        heal = target:getMaxHP() - target:getHP()
    end
    
    target:addHP(heal)
    target:addMP(mp)
    target:addTP(math.random(250, 500))
    target:addStatusEffect(tpz.effect.REGEN, 3, 0, 30)
    target:addStatusEffect(tpz.effect.REFRESH, 3, 0, 30)
    target:addStatusEffect(tpz.effect.REGAIN, 1, 0, 30)

    skill:setMsg(tpz.msg.basic.SELF_HEAL)
    return heal
end
