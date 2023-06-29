---------------------------------------------
-- cannibal blade
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
    local accmod  = 2
    local dmgmod  = 3.50
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_BONUS, 3.50, 4.50, 5.00)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
    
    if dmg > 0 then
        if not target:isUndead() then
            dmg = mob:getMaxHP() - mob:getHP()
            mob:addHP(dmg)
            skill:setMsg(tpz.msg.basic.SKILL_DRAIN_HP)
        end
    end

    return dmg
end
