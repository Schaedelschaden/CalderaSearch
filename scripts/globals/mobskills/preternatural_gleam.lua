---------------------------------------------------
-- Preternatural Gleam
-- Deals light damage to enemies within a fan-shaped area originating from caster.
-- Additional Effect: Paralysis & Mute
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1.75
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.LIGHT, dmgmod, TP_NO_EFFECT, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHT, MOBPARAM_WIPE_SHADOWS)
	
	local typeEffect1 = tpz.effect.PARALYSIS
	local typeEffect2 = tpz.effect.MUTE
	
	MobStatusEffectMove(mob, target, typeEffect1, 35, 0, 30)
	MobStatusEffectMove(mob, target, typeEffect2, 1, 0, 30)
	
    return dmg
end
