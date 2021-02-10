---------------------------------------------------
--  Tegmina Buffet
--  Family: Chapuli
--  Description: Deals physical damage to enemies within range. Damage varies with TP.
--  Additional Effect: Choke (-33 VIT & 15 damage/tic).
--  Type: Physical
--  Range: Radial
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
	local typeEffect = tpz.effect.CHOKE
	local duration = 60
	
	MobStatusEffectMove(mob, target, typeEffect, 15, 0, duration)
	
	local numhits = 1
    local accmod = 1
    local dmgmod = 2.00
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
--	printf("tegmina_buffet.cpp onMobWeaponSkill BASE DMG: [%i]", info.dmg);
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
--	printf("tegmina_buffet.cpp onMobWeaponSkill FINAL DMG: [%i]\n", dmg);
	
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
	
    return dmg
end