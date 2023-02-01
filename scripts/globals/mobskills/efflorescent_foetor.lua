---------------------------------------------------
-- Efflorescent Foetor
--
-- Description: Sprays toxic pollen in a fan-shaped area of effect, inflicting Blind & Silence.
-- Additional effect: Blind & Silence
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 10' cone
-- Notes:
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 2, tpz.magic.ele.EARTH, dmgmod, TP_MAB_BONUS, 1)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_IGNORE_SHADOWS)

    local typeEffect1 = tpz.effect.BLINDNESS
    local typeEffect2 = tpz.effect.SILENCE

    MobStatusEffectMove(mob, target, typeEffect1, 50, 0, 120)
    MobStatusEffectMove(mob, target, typeEffect2, 1, 0, 120)

    return dmg
end
