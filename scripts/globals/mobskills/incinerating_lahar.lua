---------------------------------------------
--  Incinerating Lahar
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = MobBreathMove(mob, target, 0.5, 1.25, tpz.magic.ele.FIRE, math.random(500, 1800)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)
    
	return dmg
end
