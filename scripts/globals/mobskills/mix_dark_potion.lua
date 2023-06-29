---------------------------------------------
-- Mix Dark Potion
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
    local dmg    = 666
    local effect = tpz.effect.POISON
    
    if dmg > target:getHP() then
        dmg = target:getHP()
    end
    
    target:takeDamage(dmg)
    target:addStatusEffect(effect, 2, 0, 60)
    skill:setMsg(tpz.msg.basic.NONE)
    return effect
end
