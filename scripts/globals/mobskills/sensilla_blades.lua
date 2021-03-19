---------------------------------------------------
--  Sensilla Blades
--  Family: Chapuli
--  Description: Deals physical damage to enemies within a fan-shaped area. Damage varies with TP.
--  Type: Physical
--  Range: Conal
--  Notes:
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)	
	local numhits = 1
    local accmod = 1
    local dmgmod = 3.5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
--	printf("sensilla_blades.cpp onMobWeaponSkill BASE DMG: [%i]", info.dmg);
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
--	printf("sensilla_blades.cpp onMobWeaponSkill FINAL DMG: [%i]\n", dmg);
	
    return dmg
end