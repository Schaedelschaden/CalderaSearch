---------------------------------------------
--  Right Side Paralyze Attack (Pteraketos "standard" attack)
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

    if targetPosition >= 52 and targetPosition <= 84 then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod  = 2
    local dmgmod  = math.random(275, 295) / 100
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)

    if dmg > 0 then
        target:addStatusEffect(tpz.effect.PARALYSIS, 30, 0, 120)
    end

	if info.hitslanded == 0 and dmg == 0 then
        skill:setMsg(tpz.msg.basic.NORMAL_MISS)
    elseif info.hitslanded == 1 and dmg == 1 then
        skill:setMsg(tpz.msg.basic.SHADOW_ABSORB)
    else
        skill:setMsg(tpz.msg.basic.HIT_DMG)
        mob:addTP(200)
    end

    return dmg
end
