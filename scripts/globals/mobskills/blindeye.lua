---------------------------------------------
--  Blindeye
--
--  Description: Inflicts damage on a single target. Additional effect: Blind
--  Type: Physical
--  Utsusemi/Blink absorb: Yes
--  Range: Single target
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
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.4
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)
    
    local typeEffect = tpz.effect.BLINDNESS
	
	if (mob:getMainLvl() >= 135) then
		dmgmod = 7
	else
		dmgmod = 2.4
	end

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 15, 0, 120)

    return dmg
end
