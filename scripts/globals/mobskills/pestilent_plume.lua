---------------------------------------------------
--  Pestilent Plume
--  Family: Acuex
--  Description: Deals Darkness elemental damage in a fan-shaped area. Damage varies with TP.
--  Additional effects: Plague (-50 TP/tic), Blind (-50 Accuracy), -25 MDB.
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
    local typeEffect1 = tpz.effect.PLAGUE
	local typeEffect2 = tpz.effect.BLINDNESS
	local typeEffect3 = tpz.effect.MAGIC_DEF_DOWN
    local duration = 60

    MobStatusEffectMove(mob, target, typeEffect1, 5, 0, duration)
	MobStatusEffectMove(mob, target, typeEffect2, 50, 0, duration)
	MobStatusEffectMove(mob, target, typeEffect3, 25, 0, duration)

    local dmgmod = 1.20
    local baseDamage = mob:getWeaponDmg() * 4.2
--	printf("pestilent_plume.cpp onMobWeaponSkill BASE DMG: [%i]\n", baseDamage);
    local info = MobMagicalMove(mob, target, skill, baseDamage, tpz.magic.ele.DARK, dmgmod, TP_DMG_VARIES, 2, 2.5, 3)
--	printf("pestilent_plume.cpp onMobWeaponSkill DMG: [%i]\n", info.dmg);
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)
--	printf("pestilent_plume.cpp onMobWeaponSkill FINAL DMG: [%i]\n", dmg);
	
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)
	
    return dmg
end