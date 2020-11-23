-----------------------------------------
-- Spell: Fantod
-- Enhances attack and magic attack.
-- Spell cost: 12 MP
-- Monster Type: Birds
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 1
-- Stat Bonus: HP-10 DEX+2 AGI+2
-- Level: 85
-- Casting Time: 0.5 seconds
-- Recast Time: 10 seconds
-- Duration: 3 minutes (or until next attack)
-- Combos: Store TP
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	caster:addStatusEffect(tpz.effect.ATTACK_BOOST, 15, 0 , 180)
	caster:addStatusEffect(tpz.effect.MAGIC_ATK_BOOST, 10, 0 , 180)

    return tpz.effect.ATTACK_BOOST
end