---------------------------------------------
--  Revelation
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
    local accmod = 1
    local dmgmod = 4

    local info = MobRangedMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)

    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.RANGED, tpz.damageType.PIERCING, info.hitslanded)
    
    if mob:getObjType() == tpz.objType.TRUST then
        dmg = dmg * (mob:getMainLvl() / 2.5)
    end
    
    target:addStatusEffect(tpz.effect.DIA, 1, 0, 30)
    
    return dmg
end
