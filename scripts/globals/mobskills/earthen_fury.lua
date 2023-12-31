---------------------------------------------------
-- Earthen Fury
-- Deals Earth elemental damage to enemies within area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 3
	
	-- Adjust Trial By Earth Titan's Earthen Fury damage
	if (mob:getID() == 17633281) then
		dmgmod = 1.25
	end
	
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 9, tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)
    
	return dmg
end
