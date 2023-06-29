---------------------------------------------
-- Mix Life Water
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if target:hasStatusEffect(tpz.effect.REGEN) then
        return 1
    else
        return 0
    end
end

function onMobWeaponSkill(target, mob, skill)
    local effect = tpz.effect.REGEN
    
    target:addStatusEffect(effect, 10, 0, 300)
    skill:setMsg(tpz.msg.basic.NONE)

    return effect
end
