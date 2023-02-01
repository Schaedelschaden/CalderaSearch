-----------------------------------
-- Ice Guillotine
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
-----------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.ICE, dmgmod, TP_MAB_BONUS, 1)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ICE, MOBPARAM_WIPE_SHADOWS)

    local typeEffect1 = tpz.effect.MAX_HP_DOWN
    local typeEffect2 = tpz.effect.PARALYSIS
    local typeEffect3 = tpz.effect.AMNESIA

    MobStatusEffectMove(mob, target, typeEffect1, 25, 0, 120)
    MobStatusEffectMove(mob, target, typeEffect2, 20, 0, 120)
    MobStatusEffectMove(mob, target, typeEffect3, 1, 0, 60)

    return dmg
end
