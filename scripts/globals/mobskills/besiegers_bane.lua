---------------------------------------------
-- Besieger's Bane
-- Family: Caturae
-- Description: Inflicts all within an area of effect with Bio, Zombie, and Terror
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: AoE 20'
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:getHPP() <= 25 then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local numEffects  = 3

    target:addStatusEffect(tpz.effect.BIO, 60, 0, 120)
    target:addStatusEffect(tpz.effect.CURSE_II, 1, 0, 10)
    target:addStatusEffect(tpz.effect.TERROR, 1, 0, 10)

    skill:setMsg(tpz.msg.basic.MULTIPLE_ENFEEBLE)

    return numEffects
end
