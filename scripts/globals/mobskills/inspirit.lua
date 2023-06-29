---------------------------------------------
-- inspirit
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
    local hp      = target:getMaxHP() / math.random(4, 10)
    local mp      = target:getMaxMP() / math.random(4, 10)
    local cap     = hp - target:getHP()
    local potency = mob:getMainLvl() / 4
    local heal
    
    heal = hp 
    
    if heal > target:getMaxHP() - target:getHP() then
        heal = target:getMaxHP() - target:getHP()
    end
    
    if mob:isMobType(MOBTYPE_NOTORIOUS) then
        heal = math.random(40000, 50000)
    end
    
    if not mob:isMobType(MOBTYPE_NOTORIOUS) then
        mob:setTP(1000)
    end
    target:addHP(heal)
    target:addMP(mp)
    target:eraseStatusEffect()
    skill:setMsg(tpz.msg.basic.SELF_HEAL)
    return heal
end
