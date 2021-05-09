---------------------------------------------------
-- Tidal Wave
-- Deals water elemental damage to enemies within area of effect.
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 3
	
	-- Adjust Trial By Water Leviathan's Tidal Wave damage
	if (mob:getID() == 17641473) then
		dmgmod = 3
	end
	
    info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 9, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT, 1)
    dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)
	
	return dmg
end
