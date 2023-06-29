-----------------------------------
--  Aqua Blast
--
--  Description: Fires a blast of Water, dealing damage in a fan-shaped area.
--  Additional effect: knockback
--  Type: Magical (Water)
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Fan (cone)
--  Note: There was not a lot of information about this spell available online, so
--        the initial implementation is relatively basic.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
-----------------------------------

function onMobSkillCheck(target, mob, skill)
    local isSedna = false

    if
        mob:getID() == 17666500 or
        mob:getID() == 17666504 or
        mob:getID() == 17666508
    then
        isSedna = true
    end

    -- Do not use this weapon skill on targets behind. Sub-Zero Smash
    -- should trigger in this case.
    if
        target:isBehind(mob) and
        isSedna == false
    then
        return 1
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local isSedna = false

    if
        mob:getID() == 17666500 or
        mob:getID() == 17666504 or
        mob:getID() == 17666508
    then
        isSedna = true
    end

    local dmgmod = 1
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)

    if isSedna == true then
        local numhits = 1
        local accmod  = 1

        dmgmod  = 1
        info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES)
        dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, info.hitslanded)
    end

    return dmg
end
