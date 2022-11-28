---------------------------------------------------
-- Arctic Impact
-- Deals Ice damage to enemies within range.
-- Area of Effect is centered around caster.
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2.2
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 5, tpz.magic.ele.ICE, dmgmod, 0)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ICE, MOBPARAM_WIPE_SHADOWS)

    return dmg
end
