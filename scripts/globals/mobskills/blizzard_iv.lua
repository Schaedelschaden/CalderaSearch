---------------------------------------------------
-- Blizzard IV
-- Deals ice elemental damage.
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
	
		-- Adjust Trial Ice Shiva's damage
	if (mob:getID() == 17608705) then
		dmgmod = 3
	end
	
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, tpz.magic.ele.ICE, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ICE, MOBPARAM_WIPE_SHADOWS)
    
	return dmg
end
