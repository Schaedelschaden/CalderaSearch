---------------------------------------------------
-- Depth Charge
--
-- Description: Inflicts damage, shock, and knockback. User gains Shock Spikes
-- Type: Magical (Lightning)
-- Utsusemi/Blink absorb: 
-- Range: Unknown
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.SHOCK
    local duration   = 120
    local dmgmod     = 2.75

    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 5, tpz.magic.ele.LIGHTNING, dmgmod, TP_MAB_BONUS, 1)
    local dmg  = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING, MOBPARAM_WIPE_SHADOWS)

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, duration)
    MobBuffMove(mob, tpz.effect.SHOCK_SPIKES, 150, 0, 180)

    return dmg
end
