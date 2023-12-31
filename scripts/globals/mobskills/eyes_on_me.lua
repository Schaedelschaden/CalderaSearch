---------------------------------------------
--  Eyes on Me
--  Deals dark damage to an enemy.
--  Spell Type: Magical (Dark)
--  Range: Casting range 13'
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = mob:getWeaponDmg() * 4
	
	if (mob:getMainLvl() >= 135) then
		dmgmod = mob:getWeaponDmg() * 12
	else
		dmgmod = mob:getWeaponDmg() * 4
	end

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.SPECIAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)

    return dmg
end
