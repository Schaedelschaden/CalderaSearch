-----------------------------------------
-- Spell: Reactor Cool
-- Enhances defense and covers you with magical ice spikes. Enemies that hit you take ice damage.
-- Spell cost: 28 MP
-- Monster Type: Luminions
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 5
-- Stat Bonus: INT+3 MND+3
-- Level: 74
-- Casting Time: 3 seconds
-- Recast Time: 60 seconds
-- Duration: 120 seconds (2 minutes)
--
-- Combos: Magic Attack Bonus
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/bluemagic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = 180

    if (caster:hasStatusEffect(tpz.effect.DIFFUSION)) then
        local diffMerit = caster:getMerit(tpz.merit.DIFFUSION)

        if (diffMerit > 0) then
            duration = duration + (duration / 100) * diffMerit
        end

        caster:delStatusEffect(tpz.effect.DIFFUSION)
    end


    target:addStatusEffect(tpz.effect.ICE_SPIKES, 5, 0, duration)
    target:addStatusEffect(tpz.effect.DEFENSE_BOOST, 12, 0, duration)
    spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)

    return tpz.effect.ICE_SPIKES
end