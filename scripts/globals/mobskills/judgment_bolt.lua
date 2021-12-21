---------------------------------------------------
-- Judgment Bolt
-- Deals lightning elemental damage to enemies within area of effect.
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
	
	-- Adjust Trial By Lightning Ramuh's Judgment Bolt damage
	if (mob:getID() == 17604609) then
		dmgmod = 1.75
	end
	
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 9, tpz.magic.ele.THUNDER, dmgmod, TP_NO_EFFECT, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING, MOBPARAM_WIPE_SHADOWS)
    
	return dmg
end