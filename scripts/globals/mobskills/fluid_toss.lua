---------------------------------------------
--  Fluid Toss
--
--  Description: Lobs a ball of liquid at a single target.
--  Type: Ranged
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Unknown range
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
    local dmgmod = 2.7
	
	if (mob:isPet()) then
		dmgmod = 1.25
	end
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
	
    return dmg
end