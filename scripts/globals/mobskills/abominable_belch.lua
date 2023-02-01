---------------------------------------------
-- Abominable Belch
-- Description: inflicts all targets in an area of effect with silence, paralysis and plague.
-- Radial
-- Ignores Shadows
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if
        mob:isNM() and -- NM's replace Vile Belch with Abominable Belch below 50% HP
        mob:getHPP() <= 50
    then
        return 0
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local numEffects = 3

    MobStatusEffectMove(mob, target, tpz.effect.SILENCE, 1, 0, 120)
    MobStatusEffectMove(mob, target, tpz.effect.PLAGUE, 25, 3, 120)
    MobStatusEffectMove(mob, target, tpz.effect.PARALYSIS, 25, 0, 120)

    skill:setMsg(tpz.msg.basic.MULTIPLE_ENFEEBLE)

    return numEffects
end
