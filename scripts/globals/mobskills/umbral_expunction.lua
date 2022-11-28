---------------------------------------------------
-- Umbral Expunction
-- AoE magical damage
---------------------------------------------
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 7
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg(), tpz.magic.ele.DARK, dmgmod, TP_NO_EFFECT, 1)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)

    return dmg
end
