---------------------------------------------
-- Debilitating Drone (Damaging & Enfeebling)
-- Description: AoE damage, random stat down and resets enmity
-- Type: Physical
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local effects =
    {
        tpz.effect.STR_DOWN, tpz.effect.DEX_DOWN, tpz.effect.VIT_DOWN, tpz.effect.AGI_DOWN,
        tpz.effect.INT_DOWN, tpz.effect.MND_DOWN, tpz.effect.CHR_DOWN
    }

    local numhits = 1
    local accmod  = 1
    local dmgmod  = 2.6
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)

    MobStatusEffectMove(mob, target, effects[math.random(#effects)], 50, 3, 60)

    mob:resetEnmity(target)

    return dmg
end
