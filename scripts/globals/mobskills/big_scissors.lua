---------------------------------------------------
-- Big Scissors: Deals damage to a single target.
-- Nightmare Crabs ignore shadows
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod  = 1
    local dmgmod  = 2.4
    local shadows = 1

    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)

    if mob:getLocalVar("MOBSKILL_INCREASED_POTENCY") > 0 then
        shadows = MOBPARAM_IGNORE_SHADOWS
    else
        shadows = info.hitslanded
    end

    local dmg  = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, shadows)

    return dmg
end
