---------------------------------------------
-- mix: antidote
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
    local curse  = tpz.effect.CURSE_I
    local curse2 = tpz.effect.CURSE_II
    local bane   = tpz.effect.BANE
    local plague = tpz.effect.PLAGUE
    local poison = tpz.effect.POISON
    local power  = 50

    if (target:hasStatusEffect(tpz.effect.DOOM) and power > math.random(1, 100)) then
        target:delStatusEffect(tpz.effect.DOOM)
        target:messageBasic(tpz.msg.basic.NARROWLY_ESCAPE)
    else
        target:delStatusEffect(curse)
        target:delStatusEffect(curse2)
        target:delStatusEffect(bane)
        target:delStatusEffect(plague)
        target:delStatusEffect(poison)        
    end
    skill:setMsg(tpz.msg.basic.NONE)
    
    return
end
