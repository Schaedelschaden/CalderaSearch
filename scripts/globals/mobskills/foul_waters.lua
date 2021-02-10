---------------------------------------------------
--  Foul Waters
--  Family: Acuex
--  Description: Deals Water elemental damage within a fan-shaped area. Damage varies with TP.
--  Additional effects: Drown (-33 STR & 15 damage/tic) & Weight.
--  Type: Magical
--  Range: Conal
--  Notes:
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.DROWN
	local typeEffect2 = tpz.effect.WEIGHT
    local duration = 60
	local master = mob:getMaster()

    MobStatusEffectMove(mob, target, typeEffect1, 15, 0, duration)
	MobStatusEffectMove(mob, target, typeEffect2, 20, 0, duration)

    local dmgmod = 1.5
    local baseDamage = mob:getWeaponDmg() * 4.2
    local info = MobMagicalMove(mob, target, skill, baseDamage, tpz.magic.ele.WATER, dmgmod, TP_DMG_VARIES, 2, 2.5, 3)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)
	
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WATER)
	
    return dmg
end