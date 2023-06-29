---------------------------------------------
-- Mix Guard Drink
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if target:hasStatusEffect(tpz.effect.MIGHTY_GUARD) then
        return 1
    else
        return 0
    end
end

function onMobWeaponSkill(target, mob, skill)
    local effect = tpz.effect.PROTECT
    
    target:addStatusEffect(tpz.effect.PROTECT, 5, 0, 300)
    target:addStatusEffect(tpz.effect.SHELL, 5, 0, 300)
    skill:setMsg(tpz.msg.basic.NONE)

    return effect
end
