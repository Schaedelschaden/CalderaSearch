-----------------------------------------
-- Spell: Mighty Guard
-- Increases own defense, magic defenses, and attack speed, and gradually restores own HP.
-- Spell cost: 299 MP
-- Monster Type: Dragon
-- Spell Type: Magical (Light)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus: 
-- Level: 99
-- Casting Time: 9 second
-- Recast Time: 30 seconds
-- Duration: 3 minutes
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local typeEffect = tpz.effect.MIGHTY_GUARD
    local duration   = handleDiffusion(caster, target, spell, 180)

	target:addStatusEffect(typeEffect, 1, 0, duration)

    spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)

    caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)

    return typeEffect
end
