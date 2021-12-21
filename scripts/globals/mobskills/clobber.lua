---------------------------------------------
-- Clobber
-- Deals damage to targets behind it with a tail swipe.
-- Utsusemi/Blink absorb: 2-3 shadows
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
	-- Only used if player with hate is behind.
    if (target:isBehind(mob, 48)) then
        return 0
    else
		return 1
	end
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = math.random(2,3)
    local accmod = 1
    local dmgmod = 2
	
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)
	
    return dmg
end