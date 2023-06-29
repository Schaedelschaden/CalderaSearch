---------------------------------------------
-- Echo Drops
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
    local effect = tpz.effect.SILENCE
    
    if (target:hasStatusEffect(effect) == true) then
        target:delStatusEffect(effect)
    end


    skill:setMsg(tpz.msg.basic.NONE)
    return effect
end
