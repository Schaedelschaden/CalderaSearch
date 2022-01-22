---------------------------------------------
--  Crystal Weapon
--
--  Description: Invokes the power of a crystal to deal magical damage of a random element to a single target.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown
--  Notes: Can be Fire, Earth, Wind, or Water element.  Functions even at a distance (outside of melee range).
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    -- local dmgmod = 1
	
	if (mob:getMainLvl() >= 130) then
		dmgmod = 2.5
	else
		dmgmod = 1
	end
	
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.WATER, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)
    return dmg
end
