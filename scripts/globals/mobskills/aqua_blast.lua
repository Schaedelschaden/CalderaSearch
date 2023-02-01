-----------------------------------
--  Aqua Blast
--
--  Description: Fires a blast of Water, dealing damage in a fan-shaped area. Additional effect: knockback
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
    -- Do not use this weapon skill on targets behind. Sub-Zero Smash
    -- should trigger in this case.
    if target:isBehind(mob) then
        return 1
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)

    return dmg
end
