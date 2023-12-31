---------------------------------------------------
-- Spinning Dive
-- Leviathan delivers a single-hit attack on target.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    numhits = 1
    accmod = 2
    dmgmod = 2
	
						-- Adjust Trial Water Leviathan's damage
	if (mob:getID() == 17641473) then
		dmgmod = 4
	end
	
    info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT, 1, 2, 3)
    dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
    return dmg
end
