---------------------------------------------------
-- Sheep Charge
-- Deals damage to a single target. Additional effect: Knockback
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    -- Needs Knockback added
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.2
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
	local shadows = info.hitslanded
	
	-- Dozing Dorian's Sheep Charge ignores shadows
	if (mob:getID() == 17318434) then
		shadows = MOBPARAM_IGNORE_SHADOWS
	end
	
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, shadows)
	
    return dmg
end