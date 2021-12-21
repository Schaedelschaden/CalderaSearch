---------------------------------------------
-- Crippling Slam
-- Deals severe damage to targets in front of it by slamming into them.
-- Additional effect: Paralysis.
-- Utsusemi/Blink absorb: Wipes shadows
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
	-- Only used if player with hate is in front.
    if not (mob:isNM()) and (target:isBehind(mob, 48)) then
        return 1
    end
	
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 4
	
	if (mob:getID() == 17207725 or mob:getID() == 17207724 or mob:getID() == 17207723) then
		dmgmod = 7
	end
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)
	
	local typeEffect = tpz.effect.PARALYSIS
	
	MobStatusEffectMove(mob, target, typeEffect, 50, 0, 30)
	
    return dmg
end