---------------------------------------------------
-- Rush
-- Shiva delivers a five-hit attack to target.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 5
    local accmod = 1
    local dmgmod = 1
	
	-- Adjust Trial of Ice Shiva's damage
	if (mob:getID() == 17608705) then
		dmgmod = 1.60
	end
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT, 1, 2, 3)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)
    return dmg
end
