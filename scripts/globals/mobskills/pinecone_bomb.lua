---------------------------------------------
--  Pinecone Bomb
--
--  Description: Single target damage with sleep.
--  Mobskill ID: 297 - Unused
--  Mobskill ID: 329 - Single Target
--  Mobskill ID: 928 - Radial AoE
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod  = 1
    local dmgmod  = 2.3

    if mob:getID() == 16937051 then
        dmgmod = 5
    elseif mob:getID() == 17404339 then -- Modron
        dmgmod = 3
        mob:resetEnmity(target)
    end

    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local shadows = info.hitslanded

    if mob:getLocalVar("ENHANCED_TP_MOVES") ~= 0 then
        shadows = MOBPARAM_WIPE_SHADOWS
    end

    local dmg        = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, shadows)
    local typeEffect = tpz.effect.SLEEP_I

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 30)

    return dmg
end
