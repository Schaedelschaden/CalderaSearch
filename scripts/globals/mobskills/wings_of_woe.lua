---------------------------------------------
-- Wings of Woe
-- Damages all targets in range. Additional effect: Plague and Slow
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
	local dmgmod = 2
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_WIPE_SHADOWS)
	
	MobStatusEffectMove(mob, target, tpz.effect.SLOW, 1250, 0, 60)
	MobStatusEffectMove(mob, target, tpz.effect.PLAGUE, 12, 0, 60)
	
    return dmg
end