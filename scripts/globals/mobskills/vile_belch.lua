---------------------------------------------
-- Vile Belch
--
-- Description: Belches up noxious fumes, inflicting all targets in an area of effect with Silence and Plague.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.SILENCE
    local typeEffect2 = tpz.effect.PLAGUE
    local duration    = math.random(60, 90)
    local dmgmod      = MobBreathMove(mob, target, 0.25, 3, tpz.magic.ele.EARTH, 500)
    local dmg         = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.EARTH, MOBPARAM_IGNORE_SHADOWS)

    MobStatusEffectMove(mob, target, typeEffect1, 1, 0, duration)
    MobStatusEffectMove(mob, target, typeEffect2, 10, 0, duration)

    return dmg
end
