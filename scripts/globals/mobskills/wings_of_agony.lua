---------------------------------------------
-- Wings of Agony
-- Damages all targets in range. Additional effect: Paralyze and Sleep
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
	
	if (mob:getID() == 17559871) then
		dmgmod = 3
	end
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_WIPE_SHADOWS)
	
	MobStatusEffectMove(mob, target, tpz.effect.PARALYSIS, 75, 0, 60)
	MobStatusEffectMove(mob, target, tpz.effect.SLEEP_II, 1, 0, 60)
	
    return dmg
end