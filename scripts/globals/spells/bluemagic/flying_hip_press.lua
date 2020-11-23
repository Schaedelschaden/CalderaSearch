-----------------------------------------
-- Spell: Flying Hip Press
-- Deals wind damage to enemies within range
-- Spell cost: 125 MP
-- Monster Type: Beastmen
-- Spell Type: Breath (Wind)
-- Blue Magic Points: 3
-- Stat Bonus: AGI+1
-- Level: 58
-- Casting Time: 5.75 seconds
-- Recast Time: 34.5 seconds
-- Magic Bursts On: Detonation, Fragmentation, and Light
-- Combos: Max HP Boost
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    	local params = {}
		params.attackType = tpz.attackType.BREATH
		params.damageType = tpz.damageType.WIND
		params.spellFamily = tpz.ecosystem.HUMANOID
		params.hpMod = 33 -- 50%
		params.lvlMod = 1.50 -- fLV
		params.bonus = 1.00 -- +% Base Damage Bonus
		params.multiplier = 1.50 -- Azure Lore Damage multiplier
	
	local damage = BlueBreathSpell(caster, target, spell, params)
	damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end