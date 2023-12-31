---------------------------------------------
--  Zephyr Arrow
--
--  Description: Deals a ranged attack to target. Additional effect: Knockback &amp Bind
--  Type: Ranged
--  Utsusemi/Blink absorb: Ignores Utsusemi
--  Range: Unknown
--  Notes:
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BIND

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 120)

    local numhits = 1
    local accmod = 4
    local dmgmod = 3
	
	-- Baba Yaga uses this as a "regular" attack and deals less damage with it
	if (mob:getID() == 17318441) then
		dmgmod = 1.75
	end
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.RANGED, tpz.damageType.PIERCING, MOBPARAM_IGNORE_SHADOWS)
    
	return dmg
end
