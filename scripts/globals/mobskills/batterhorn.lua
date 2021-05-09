---------------------------------------------
-- Batterhorn
-- Deals damage to targets in front of it with a horn bash.
-- Utsusemi/Blink absorb: 1-2 shadows
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
	-- Only used if player with hate is in front.
    if (target:isBehind(mob, 48)) then
        return 1
    end
	
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 2
    local accmod = 1
    local dmgmod = 1.5
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)
	
    return dmg
end