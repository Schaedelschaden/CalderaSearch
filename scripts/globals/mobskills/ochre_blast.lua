---------------------------------------------
--  Ochre Blast
--
--  Description: Deals fire damage to enemies in area of effect.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 18' radial.
--  Notes: Used only by Ouryu and Cuelebre while flying.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    if (mob:AnimationSub() ~= 1) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
	local baseDmg = mob:getWeaponDmg() * 8
	
	if (mob:getID() == 16961932) then
		baseDmg = mob:getWeaponDmg() * 3
	end
	
    local info = MobMagicalMove(mob, target, skill, baseDmg, tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)
    return dmg
end