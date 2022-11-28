---------------------------------------------------
-- Flesh Syphon
-- Single target physical damage, absorbs all attributes
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod  = 1
    local dmgmod  = 2.0
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, info.hitslanded)

    target:addStatusEffect(tpz.effect.STR_DOWN, 50, 3, 180)
    target:addStatusEffect(tpz.effect.DEX_DOWN, 50, 3, 180)
    target:addStatusEffect(tpz.effect.VIT_DOWN, 50, 3, 180)
    target:addStatusEffect(tpz.effect.AGI_DOWN, 50, 3, 180)
    target:addStatusEffect(tpz.effect.INT_DOWN, 50, 3, 180)
    target:addStatusEffect(tpz.effect.MND_DOWN, 50, 3, 180)
    target:addStatusEffect(tpz.effect.CHR_DOWN, 50, 3, 180)
    mob:addStatusEffect(tpz.effect.STR_BOOST, 50, 3, 180)
    mob:addStatusEffect(tpz.effect.DEX_BOOST, 50, 3, 180)
    mob:addStatusEffect(tpz.effect.VIT_BOOST, 50, 3, 180)
    mob:addStatusEffect(tpz.effect.AGI_BOOST, 50, 3, 180)
    mob:addStatusEffect(tpz.effect.INT_BOOST, 50, 3, 180)
    mob:addStatusEffect(tpz.effect.MND_BOOST, 50, 3, 180)
    mob:addStatusEffect(tpz.effect.CHR_BOOST, 50, 3, 180)

    return dmg
end
