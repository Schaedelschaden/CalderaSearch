---------------------------------------------
--  Thunderbolt
--
--  Description: Deals Lightning damage in an area of effect. Additional effect: Stun
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range:
--  Notes:
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.STUN

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 4)

    local dmgmod = 1
	
			-- Adjust King Behemoth
	if (mob:getID() == 17297441) then
		dmgmod = 2.7
	end
	
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*4, tpz.magic.ele.THUNDER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING, MOBPARAM_IGNORE_SHADOWS)
    return dmg
end
