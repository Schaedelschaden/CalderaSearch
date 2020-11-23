-----------------------------------------
-- Spell: Pyric Bulwark
-- Resists physical damage.
-- Spell cost: 50 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus: 
-- Level: 98
-- Casting Time: 1.5 seconds
-- Recast Time: 30 seconds
-- Duration: 60 seconds
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	caster:addStatusEffect(tpz.effect.PHYSICAL_SHIELD, 1, 0, 60)
	
	caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)

    return tpz.effect.PHYSICAL_SHIELD
end