---------------------------------------------
-- Mix Elemental Power
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
    local effect = tpz.effect.MAGIC_ATK_BOOST
    
    target:addStatusEffect(effect, 20, 0, 300)
    skill:setMsg(tpz.msg.basic.NONE)

    return effect
end
