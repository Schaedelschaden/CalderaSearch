---------------------------------------------
--  Wrath of Zeus
--
--  Description: A surge of Lightning is directed at targets in an area of effect around Ixion.
--  Additional effect: Silence
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Less than or equal to 10.0
--  Notes: Used by Monoceros (Dark Ixion)
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2.4
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4.4, tpz.magic.ele.THUNDER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING, MOBPARAM_WIPE_SHADOWS)

	MobStatusEffectMove(mob, target, tpz.effect.SILENCE, 1, 0, 90)

	mob:setLocalVar("Charging", 0)
	
    return dmg
end