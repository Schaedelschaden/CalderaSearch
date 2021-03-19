-----------------------------------------
-- Spell: Orcish Counterstance
-- Increases the caster's chance of countering.
-- Spell cost: 18 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 5
-- Stat Bonus: HP+10 STR+3 VIT+3 DEX-2 AGI-2
-- Level: 98
-- Casting Time: 4.5 seconds
-- Recast Time: 120 seconds
-- Duration: 3 minutes
-- Combos: Counter
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local typeEffect = tpz.effect.COUNTERSTANCE
    local power = 10
    local duration = 180

    if (caster:hasStatusEffect(tpz.effect.DIFFUSION)) then
        local diffMerit = caster:getMerit(tpz.merit.DIFFUSION)

        if (diffMerit > 0) then
            duration = (duration + (duration * (diffMerit / 100)))
        end

        caster:delStatusEffect(tpz.effect.DIFFUSION)
    end

    if (target:addStatusEffect(typeEffect, power, 0, duration) == false) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return typeEffect
end