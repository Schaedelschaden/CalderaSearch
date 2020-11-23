-----------------------------------------
-- Spell: Droing Whirlwind
-- Enhances attack and magic attack. Reduces spell interruption rate.
-- Spell cost: 65 MP
-- Monster Type: Aquans
-- Spell Type: Magical (Water)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus: 
-- Level: 99
-- Casting Time: 3 seconds
-- Recast Time: 30 seconds
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	local power = 10 + AQUAVEIL_COUNTER
	power = math.max(power, 1)
	
	caster:delStatusEffect(tpz.effect.AQUAVEIL)
	
	caster:addStatusEffect(tpz.effect.ATTACK_BOOST, 20, 0, 60)
	caster:addStatusEffect(tpz.effect.MAGIC_ATK_BOOST, 20, 0, 60)
	caster:addStatusEffect(tpz.effect.AQUAVEIL, power, 0, 900)
	
	caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)
	
    return tpz.effect.ATTACK_BOOST
end