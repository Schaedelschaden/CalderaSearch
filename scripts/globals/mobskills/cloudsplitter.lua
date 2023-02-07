-----------------------------------
--  Cloudsplitter
--  Axe weapon skill
--  Description: Deals lightning elemental damage.
--  Type: Physical
--  Number of hits
--  Range: Melee
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------


function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 2
    local accmod = 1
    local dmgmod = 1.50
    
    if mob:getObjType() == tpz.objType.TRUST then
        dmgmod = math.random(3, 5) + math.random()
    end
    
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, tpz.magic.ele.LIGHTNING, dmgmod, TP_DMG_VARIES, 1, 2, 3)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING, MOBPARAM_2_SHADOW)

    -- Witnessed 1100 to a DD.  Going with it :D
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
    return dmg
end


