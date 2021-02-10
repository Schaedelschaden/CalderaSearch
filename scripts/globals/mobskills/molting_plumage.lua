---------------------------------------------------
--  Molting Plumage
--  Family: Tulfaire
--  Description: Deals Wind damage to enemies within a fan-shaped area. Area of effect varies with TP.
--  Additional effects: Dispel.
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
    local typeEffect = target:dispelStatusEffect()
	
    local dmgmod = 1.50
    local baseDamage = mob:getWeaponDmg() * 4.8
--	printf("molting_plumage.cpp onMobWeaponSkill BASE DMG: [%i]\n", baseDamage);
    local info = MobMagicalMove(mob, target, skill, baseDamage, tpz.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
--	printf("molting_plumage.cpp onMobWeaponSkill DMG: [%i]\n", info.dmg);
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_IGNORE_SHADOWS)
--	printf("molting_plumage.cpp onMobWeaponSkill FINAL DMG: [%i]\n", dmg);
	
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WIND)
	
    return dmg
end