---------------------------------------------
--  Single Attack (Giant Gnat "standard" attack)
--
--  Type: Physical (Piercing)
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
    local accmod  = 2
    local dmgmod  = 3
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, info.hitslanded)

    mob:addHP(dmg)

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
