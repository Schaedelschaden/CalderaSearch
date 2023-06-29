---------------------------------------------
--  Spiral Spin
--
--  Description: Chance of effect varies with TP. Additional Effect: Accuracy Down.
--  Type: Physical (Slashing)
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- Only used during daytime
    local currentTime = VanadielHour()

    if currentTime >= 6 and currentTime <= 18 then
        return 0
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod  = 1
    local dmgmod  = 3
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_IGNORE_SHADOWS)

    local typeEffect = tpz.effect.ACCURACY_DOWN

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 50, 0, 120)

    return dmg
end
