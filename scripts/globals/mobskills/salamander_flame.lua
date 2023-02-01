-----------------------------------
-- Salamander Flame
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 4
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)
	
    return dmg
end
