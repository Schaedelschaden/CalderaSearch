-----------------------------------------
-- Spell: Auroral Drape
-- Silences and blinds enemies within range.
-- Spell cost: 51 MP
-- Monster Type: Empty
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: INT+3 CHR-2
-- Level: 84
-- Casting Time: 2.75 seconds
-- Recast Time: 20 seconds
-- Magic Bursts on: Reverbration, Distortion, Darkness
-- Combos: Double Attack / Triple Attack
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
    local duration = math.random(40,60)

	target:addStatusEffect(tpz.effect.SILENCE, 1, 0, duration)
	spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
	target:addStatusEffect(tpz.effect.BLINDNESS, 60, 0, duration)

    return tpz.effect.SILENCE
end