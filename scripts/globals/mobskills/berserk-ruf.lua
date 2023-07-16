-----------------------------------
-- Ability: Berserk-Ruf
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function OnMobSkillCheck(target, mob, skill)
    return 0
end

function OnMobWeaponSkill(target, mob, skill)
    
    target:addStatusEffect(tpz.effect.WARCRY, 25, 0, 180)
    
    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)

    return tpz.effect.WARCRY
end


