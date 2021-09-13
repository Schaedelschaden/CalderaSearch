---------------------------------------------------
-- Full-Force Blow
-- Deals damage to a single target. Additional effect: Knockback.
-- 0% TP: ??? / 150% TP: ??? / 300% TP: ???
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.8
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)
	local shadows = info.hitslanded
	
	--Megamaw Mikey's Full Force Blow ignores shadows
	if (mob:getID() == 17318450) then
		shadows = MOBPARAM_IGNORE_SHADOWS
	end
	
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
    return dmg
end