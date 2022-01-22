---------------------------------------------
--  Drill Branch
--
--  Description: Drills a single target with a branch. Additional effect: Blind
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Melee
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
    local dmgmod = 2.5
	
	if (mob:getID() == 16937051) then
		dmgmod = 5
	end
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, info.hitslanded*math.random(2, 3))

    local typeEffect = tpz.effect.BLINDNESS

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 15, 0, 120)
	
	if (mob:getLocalVar("ENHANCED_TP_MOVES") ~= 0) then
		local typeEffect2 = tpz.effect.POISON
		
		MobPhysicalStatusEffectMove(mob, target, skill, typeEffect2, 75, 3, 120)
	end

    return dmg
end