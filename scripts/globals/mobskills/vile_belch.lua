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
    if
        mob:isNM() and -- NM's replace this with Abominable Belch below 50% HP
        mob:getHPP() > 50
    then
        return 0
    elseif not mob:isNM() then
        return 0
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.SILENCE
    local typeEffect2 = tpz.effect.PLAGUE
    local numEffects  = 2
    local duration    = math.random(60, 90)

    MobStatusEffectMove(mob, target, typeEffect1, 1, 0, duration)
    MobStatusEffectMove(mob, target, typeEffect2, 10, 0, duration)

    skill:setMsg(tpz.msg.basic.MULTIPLE_ENFEEBLE)

    return numEffects
end
