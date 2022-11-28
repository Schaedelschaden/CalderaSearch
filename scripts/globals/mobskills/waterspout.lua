---------------------------------------------------
-- Water Spout
--
-- Description: Inflicts damage and Attributes down
-- Type: Magical (Water)
-- Utsusemi/Blink absorb: 
-- Range: Unknown
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2.30

    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 2, tpz.magic.ele.WATER, dmgmod, TP_MAB_BONUS, 1)
    local dmg  = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)

    MobStatusEffectMove(mob, target, tpz.effect.STR_DOWN, 50, 3, 180)
    MobStatusEffectMove(mob, target, tpz.effect.DEX_DOWN, 50, 3, 180)
    MobStatusEffectMove(mob, target, tpz.effect.VIT_DOWN, 50, 3, 180)
    MobStatusEffectMove(mob, target, tpz.effect.AGI_DOWN, 50, 3, 180)
    MobStatusEffectMove(mob, target, tpz.effect.INT_DOWN, 50, 3, 180)
    MobStatusEffectMove(mob, target, tpz.effect.MND_DOWN, 50, 3, 180)
    MobStatusEffectMove(mob, target, tpz.effect.CHR_DOWN, 50, 3, 180)

    return dmg
end
