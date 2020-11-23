-----------------------------------------
-- Spell: Barrier Tusk
-- Reduces the amount of damage you take.
-- Spell cost: 41 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 3
-- Stat Bonus: HP+15 MP-15 VIT+3
-- Level: 91
-- Casting Time: 6 seconds
-- Recast Time: 60 seconds
-- Duration: 3 minutes
-- Combos: Max HP Boost
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
	target:addStatusEffect(tpz.effect.PHALANX, 15, 0, 180)

    return tpz.effect.PHALANX
end