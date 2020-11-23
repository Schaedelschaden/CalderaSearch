-----------------------------------------
-- Spell: Reaving Wind
-- Reduces TP for enemies within range.
-- Spell cost: 84 MP
-- Monster Type: Birds
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: STR+2 AGI+2
-- Level: 90
-- Casting Time: 4 seconds
-- Recast Time: 26 seconds
-- Magic Bursts on: Detonation, Fragmentation, Light
-- Combos: Magic Burst Bonus
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
	target:setTP(-1000)
	
    return 0
end