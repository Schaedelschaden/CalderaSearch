---------------------------------------------
--  Glacial Tomb
--
--  Description: Deals ice damage to enemies within range. 
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
	MobStatusEffectMove(mob, target, tpz.effect.BIND, 1, 0, 30)

    local dmgmod = 3.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.ICE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ICE, MOBPARAM_IGNORE_SHADOWS)
	
    return dmg
end