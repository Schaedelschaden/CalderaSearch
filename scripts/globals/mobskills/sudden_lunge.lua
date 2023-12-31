---------------------------------------------
--  Sudden Lunge
--
--  Additional effect: Stun. Damage varies with TP.
--  Type: Physical (Slashing)
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- Only used during nighttime
    local currentTime = VanadielHour()

    if currentTime < 6 and currentTime > 18 then
        return 0
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod  = 1
    local dmgmod  = 2
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)

    local typeEffect = tpz.effect.STUN

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 5)

    if not mob:isNM() then
        local removeHP = mob:getMaxHP() * (math.random(5, 15) / 100)

        mob:delHP(removeHP)
    end

    return dmg
end
