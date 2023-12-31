---------------------------------------------------
-- Diamond Dust
-- Deals ice elemental damage to enemies within area of effect.
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1.75

    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 9, tpz.magic.ele.DARK, dmgmod, TP_NO_EFFECT, 1)
    local dmg  = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARKNESS, MOBPARAM_WIPE_SHADOWS)

    return dmg
end
