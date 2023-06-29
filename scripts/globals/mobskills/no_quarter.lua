---------------------------------------------
-- no quarter
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 3
    local accmod  = 2.5
    local dmgmod  = 4.5
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 3, 4, 5)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
    mob:setMod(tpz.mod.DMG, 0)  
    
    if mob:getObjType() == tpz.objType.TRUST then
        dmg = dmg + (mob:getMainLvl() * 35)
        mob:setMod(tpz.mod.DMG, -35)
    end
        
    if mob:getObjType() == tpz.objType.MOB then
        local quarters = 10000 / skill:getTotalTargets()
        dmg = MobFinalAdjustments(quarters, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_IGNORE_SHADOWS)
    end
    
    return dmg
end
