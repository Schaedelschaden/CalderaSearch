---------------------------------------------------
-- Stone IV
-- Titan deals earth elemental damage to target.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2

	-- Adjust Trial Earth Titan's damage
	if (mob:getID() == 17633281) then
		dmgmod = 1.85
	end
	
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, tpz.magic.ele.EARTH, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)
    return dmg
end
