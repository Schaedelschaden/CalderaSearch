---------------------------------------------
-- Madibular Massacre
-- Description: Physical damage, Paralyze, Doom
-- Type: Physical (Piercing)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod  = 1
    local dmgmod  = 4.0
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, info.hitslanded)

    MobStatusEffectMove(mob, target, tpz.effect.DOOM, 1, 3, 30)
    MobStatusEffectMove(mob, target, tpz.effect.PARALYSIS, 30, 0, 60)

    return dmg
end
