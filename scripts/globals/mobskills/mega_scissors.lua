---------------------------------------------------
-- Mega Scissors: Deals damage to a multiple targets (conal), wipes Utsusemi and resets hate.
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
    local dmgmod = 1.25
	
	if (mob:isPet()) then
		dmgmod = 1.75
	end
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_WIPE_SHADOWS)
	
	if not (mob:isPet()) then
		mob:resetEnmity(target)
	end
	
    return dmg
end