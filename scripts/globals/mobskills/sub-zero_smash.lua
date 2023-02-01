-----------------------------------
--  Sub-Zero Smash
--
--  Description: Additional Effect: Paralysis. Damage varies with TP.
--  Type: Physical (blunt)
--  Range: Cone (5' yalms)
--  Notes: This spell should be used anytime the target is behind the mob.
--         However the online documentation suggests that this spell can
--         still be used anytime. As a result, any other Ruszor spells
--         should not trigger if the target is behind the mob.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
-----------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1  -- Hits once, despite the animation looking like it hits twice.
    local dmgmod  = 1
    local accmod  = 1
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 1.5, 2)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)

    MobPhysicalStatusEffectMove(mob, target, skill, tpz.effect.PARALYSIS, 15, 0, 120)

    return dmg
end
