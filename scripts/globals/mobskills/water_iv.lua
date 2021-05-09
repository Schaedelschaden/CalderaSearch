---------------------------------------------------
-- Water IV
-- Deals water elemental damage. Damage varies with TP.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
	
						-- Adjust Trial Water Leviathan's damage
	if (mob:getID() == 17641473) then
		dmgmod = .4
	end
	
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 8, tpz.magic.ele.WATER, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)
    
	return dmg
end
