---------------------------------------------
--  Regurgitation
--
--  Description: Deals Water damage to an enemy. Additional Effect: Bind.
--  Type: Magical (Water)
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BIND
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30)

    local dmgmod = 1
	
	-- Increase Kukulkan damage modifier
	if (mob:getID() == 16839070 or mob:getID() == 16839073 or mob:getID() == 16838872) then
		dmgmod = 3.25
	end
	
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)
	
    return dmg
end