---------------------------------------------------
--  Gloom Spray
--  Family: Mosquito
--  Description: Deals darkness damage to enemies in a fan-shaped area originating from pet. Damage varies with TP.
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
	
    local dmgmod = 1.75
    local baseDamage = mob:getWeaponDmg() * 4.8
--	printf("gloom_spray.cpp onMobWeaponSkill BASE DMG: [%i]", baseDamage);
    local info = MobMagicalMove(mob, target, skill, baseDamage, tpz.magic.ele.DARK, dmgmod, TP_NO_EFFECT)
--	printf("gloom_spray.cpp onMobWeaponSkill DMG: [%i]\n", info.dmg);
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)
--	printf("gloom_spray.cpp onMobWeaponSkill FINAL DMG: [%i]\n", dmg);
	
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)
	
    return dmg
end