---------------------------------------------
-- Quake Blast
--
-- Description: Deals moderate earth damage to targets in area of effect. Additional effect: Removes equipments.
-- Type: Magical (Earth)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * math.random(4, 6), tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_IGNORE_SHADOWS)

    for i = tpz.slot.MAIN, tpz.slot.BACK do
        target:unequipItem(i)
    end

    return dmg
end
