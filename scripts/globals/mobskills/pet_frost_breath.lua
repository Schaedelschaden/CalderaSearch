---------------------------------------------
--  Flame Breath
--
--  Description: Deals Flame breath damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Flame)
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = MobBreathMove(mob, target, 0.5, 0.75, tpz.magic.ele.ICE, 560)
	
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.ICE, MOBPARAM_IGNORE_SHADOWS)
	
    return dmg
end
