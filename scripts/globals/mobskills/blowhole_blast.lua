---------------------------------------------------
-- Blowhole Blast
--
-- Description: Inflicts Paralyze
-- Type: Magical (Water)
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
    local typeEffect = tpz.effect.PARALYSIS
    local duration   = 180
    local dmgmod     = 1.55

    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, tpz.magic.ele.WATER, dmgmod, TP_MAB_BONUS, 1)
    local dmg  = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 25, 0, duration)

    return dmg
end
