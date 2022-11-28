---------------------------------------------
-- Abdominal Assault
-- Description: Damage, Gravity, TP Reset, Knockback 
-- Type: Physical (Slashing)
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
    local dmgmod  = 6.25
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)

    MobStatusEffectMove(mob, target, tpz.effect.GRAVITY, 50, 0, 45)
    target:setTP(0)

    return dmg
end
