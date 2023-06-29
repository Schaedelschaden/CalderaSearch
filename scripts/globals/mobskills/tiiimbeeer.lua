---------------------------------------------
--  Tiiimbeeer
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = MobBreathMove(mob, target, 0.5, 1.25, tpz.magic.ele.EARTH, math.random(500, 1800))
    local dmg    = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.EARTH, MOBPARAM_IGNORE_SHADOWS)

    target:addStatusEffect(tpz.effect.STR_DOWN, 50, 3, 180)
    target:addStatusEffect(tpz.effect.DEX_DOWN, 50, 3, 180)
    target:addStatusEffect(tpz.effect.VIT_DOWN, 50, 3, 180)
    target:addStatusEffect(tpz.effect.AGI_DOWN, 50, 3, 180)
    target:addStatusEffect(tpz.effect.INT_DOWN, 50, 3, 180)
    target:addStatusEffect(tpz.effect.MND_DOWN, 50, 3, 180)
    target:addStatusEffect(tpz.effect.CHR_DOWN, 50, 3, 180)
    target:addStatusEffect(tpz.effect.DOOM, 20, 3, 60)

	return dmg
end
