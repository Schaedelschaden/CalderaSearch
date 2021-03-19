-----------------------------------------
-- Spell: Erratic Flutter
-- Increases attack speed.
-- Spell cost: 92 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 6
-- Stat Bonus: HP+15 MP+15 AGI+5 CHR+5
-- Level: 99
-- Casting Time: 1 second
-- Recast Time: 45 seconds
-- Duration: 5 minutes
-- Combos: Fast Cast
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local typeEffect = tpz.effect.HASTE
    local power = 2998 -- 307/1024 ~29.98%
    local duration = 300

    if (caster:hasStatusEffect(tpz.effect.DIFFUSION)) then
        local diffMerit = caster:getMerit(tpz.merit.DIFFUSION)

        if (diffMerit > 0) then
            duration = (duration + (duration * (diffMerit / 100)))
        end

        caster:delStatusEffect(tpz.effect.DIFFUSION)
    end

	target:addStatusEffect(typeEffect, power, 0, duration)

    return typeEffect
end