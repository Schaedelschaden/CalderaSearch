---------------------------------------------
--  Fang Rush
--
--  Description: Deals major damage with a threefold attack to a single target.
--  Type: Physical
--  Utsusemi/Blink absorb: 3 shadows
--  Range: Melee
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

    local dmgmod = 2.75
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*6, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_WIPE_SHADOWS)
	
    return dmg
end