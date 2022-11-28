---------------------------------------------
--  Rear Terror Attack (Pteraketos "standard" attack)
--
--  Type: Physical (Blunt)
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/utils")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local targetPosition = mob:getFacingAngle(target)

    if
        (targetPosition >= 85 and targetPosition <= 128) or
        (targetPosition <= -85 and targetPosition >= -128)
    then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod  = 2
    local dmgmod  = math.random(350, 375) / 100
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)

    if dmg > 0 then
        target:addStatusEffect(tpz.effect.TERROR, 1, 0, 5)
    end

	if info.hitslanded == 0 and dmg == 0 then
        skill:setMsg(tpz.msg.basic.NORMAL_MISS)
    elseif info.hitslanded == 1 and dmg == 1 then
        skill:setMsg(tpz.msg.basic.SHADOW_ABSORB)
    else
        skill:setMsg(tpz.msg.basic.HIT_DMG)
    end

    return dmg
end
