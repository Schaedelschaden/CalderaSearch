---------------------------------------------------
--  Lightning Spear
--  Charges up electricity in the horn, and unleashes it at targets in a fan-shaped area of effect.
--  Additional effect: Amnesia
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1.1
	
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 7, tpz.magic.ele.THUNDER, dmgmod, TP_NO_EFFECT, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING, MOBPARAM_WIPE_SHADOWS)
	
	MobStatusEffectMove(mob, target, tpz.effect.AMNESIA, 1, 0, math.random(45, 60))
	
	mob:setLocalVar("Charging", 0)
	
    return dmg
end