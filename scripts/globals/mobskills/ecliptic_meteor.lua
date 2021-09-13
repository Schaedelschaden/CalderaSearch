---------------------------------------------------
-- Ecliptic Meteor
-- Summons a meteor to smash the opposition. Additional effect: Paralysis + Bio + Blind
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect1 = tpz.effect.PARALYSIS
	local typeEffect2 = tpz.effect.BIO
	local typeEffect3 = tpz.effect.BLINDNESS

    local dmgmod = 1.82
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 5, tpz.magic.ele.NONE, dmgmod, TP_NO_EFFECT, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ELEMENTAL, MOBPARAM_WIPE_SHADOWS)
	
	MobStatusEffectMove(mob, target, typeEffect1, 50, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect2, 35, 3, 120)
	MobStatusEffectMove(mob, target, typeEffect3, 100, 0, 60)
    
	return dmg
end