---------------------------------------------
--  Fluid Spread
--
--  Description: Splashes around liquid in an area of effect.
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: 10' radial
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = math.random(2, 3)
    local accmod = 1
    local dmgmod = .6
	
	if (mob:isPet()) then
		dmgmod = 0.5
	end
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
	
    return dmg
end