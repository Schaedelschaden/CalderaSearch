---------------------------------------------
-- Volcanic Stasis
-- Deals Fire damage to enemies within an area of effect. Needs dispel.
--
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
       return 0
end

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = 2.7
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 5, tpz.magic.ele.FIRE, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)
    return dmg
end
