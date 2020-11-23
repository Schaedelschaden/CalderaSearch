-----------------------------------------
-- Spell: Magic Barrier
-- Grants a Magic Shield effect.
-- Spell cost: 29 MP
-- Monster Type: Demons
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 3
-- Stat Bonus: MP+7 INT+2
-- Level: 82
-- Casting Time: 5 seconds
-- Recast Time: 60 seconds
-- Duration: 5 minutes
-- Combos: Max MP Boost
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local typeEffect = tpz.effect.MAGIC_SHIELD
    local power = 1
    local duration = 300

    if (caster:hasStatusEffect(tpz.effect.DIFFUSION)) then
        local diffMerit = caster:getMerit(tpz.merit.DIFFUSION)

        if (diffMerit > 0) then
            duration = (duration + (duration / 100)) * diffMerit
        end

        caster:delStatusEffect(tpz.effect.DIFFUSION)
    end

    if (target:addStatusEffect(typeEffect, power, 0, duration) == false) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return typeEffect
end