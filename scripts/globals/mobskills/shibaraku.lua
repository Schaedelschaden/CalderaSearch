---------------------------------------------
-- Shibaraku
--
-- Description: Damages enemies in an area of effect. Additional effect: Stun
-- Type: Physical
-- Utsusemi/Blink absorb: 2-3 shadows
-- Range: 10' radial
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits  = 1
    local accmod   = 1
    local dmgmod   = 2.2
    local tpEffect = TP_NO_EFFECT

    if mob:getObjType() == tpz.objType.TRUST then
        dmgmod = math.random(6, 10) + math.random()
        tpEffect = TP_DMG_VARIES
    end

    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, tpEffect)
    local dmg  = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_3_SHADOW)

    local typeEffect = tpz.effect.STUN

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 4)

    return dmg
end
