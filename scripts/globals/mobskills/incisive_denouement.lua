---------------------------------------------------
-- Aerial Wheel
-- Deals a ranged attack to a single target. Additional effect: stun
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
    local accmod = 1
    local dmgmod = 5
    local info = MobRangedMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.RANGED, tpz.damageType.PIERCING, info.hitslanded)

    target:addStatusEffect(tpz.effect.STR_DOWN, 20, 0, 180)
    target:addStatusEffect(tpz.effect.DEX_DOWN, 20, 0, 180)
    target:addStatusEffect(tpz.effect.VIT_DOWN, 20, 0, 180)
    target:addStatusEffect(tpz.effect.AGI_DOWN, 20, 0, 180)
    target:addStatusEffect(tpz.effect.INT_DOWN, 20, 0, 180)
    target:addStatusEffect(tpz.effect.MND_DOWN, 20, 0, 180)
    target:addStatusEffect(tpz.effect.CHR_DOWN, 20, 0, 180)
	mob:resetEnmity(target)

    return dmg
end
