-----------------------------------------
-- Spell: Harden Shell
-- Enhances defense.
-- Spell cost: 20 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus: 
-- Level: 95
-- Casting Time: 1.5 seconds
-- Recast Time: 25 seconds
-- Duration: 90 seconds
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	caster:addStatusEffect(tpz.effect.DEFENSE_BOOST, 100, 0, 90)
	
	caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)

    return tpz.effect.DEFENSE_BOOST
end