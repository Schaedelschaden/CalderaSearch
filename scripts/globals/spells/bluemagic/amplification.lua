-----------------------------------------
-- Spell: Amplification
-- Enhances magic attack and magic defense
-- Spell cost: 48 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Water)
-- Blue Magic Points: 3
-- Stat Bonus: HP-5, MP+5
-- Level: 70
-- Casting Time: 7 seconds
-- Recast Time: 120 seconds
-- Duration: 90 seconds
-- Combos: None
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    if (caster:hasStatusEffect(tpz.effect.DIFFUSION)) then
        local diffMerit = caster:getMerit(tpz.merit.DIFFUSION)

        if (diffMerit > 0) then
            duration = duration + (duration / 100) * diffMerit
        end

        caster:delStatusEffect(tpz.effect.DIFFUSION)
    end

    target:addStatusEffect(tpz.effect.MAGIC_ATK_BOOST, 10, 0, 90)
    target:addStatusEffect(tpz.effect.MAGIC_DEF_BOOST, 10, 0, 90)
    spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)

    return tpz.effect.MAGIC_ATK_BOOST
end