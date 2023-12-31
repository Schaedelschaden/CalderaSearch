---------------------------------------------------
-- Shoulder Attack
-- Deals damage to a single target. Additional effect: knockback
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    -- KNOCKBACK -------------------

    local numhits = 1
    local accmod = 1
    local dmgmod = 2.8
	
	if (mob:getID() == 17391803) then
		dmgmod = 4.2
	end
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
    return dmg
end
