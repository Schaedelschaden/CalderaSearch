---------------------------------------------
-- Royal Savior
-- Grants effect of Sentinel, Palisade, and Stoneskin
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    mob:addStatusEffect(tpz.effect.SENTINEL, 90, 3, 30)
	mob:addStatusEffect(tpz.effect.PALISADE, 30, 0, 60)
	mob:addStatusEffect(tpz.effect.STONESKIN, 300, 0, 300)

    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
    
    return tpz.effect.SENTINEL
end
