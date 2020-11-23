-----------------------------------------
-- Spell: Heat Breath
-- Deals fire damage to enemies within a fan-shaped area originating from the caster
-- Spell cost: 169 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 4
-- Stat Bonus: STR+3
-- Level: 71
-- Casting Time: 7.5 seconds
-- Recast Time: 49 seconds
-- Magic Bursts on: Liquefaction, Fusion, Light
-- Combos: Magic Attack Bonus
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
		params.damageType = tpz.damageType.FIRE
		params.spellFamily = tpz.ecosystem.BEAST
		params.hpMod = 50 -- 50%
		params.lvlMod = 0.3125 -- fLV
		params.bonus = 1.00 -- +% Base Damage Bonus
		params.multiplier = 1.50 -- Azure Lore Damage multiplier
	
	local damage = BlueBreathSpell(caster, target, spell, params)
	damage = BlueFinalAdjustments(caster, target, spell, damage, params)
--	printf("Heat Breath onSpellCast DAMAGE: [%i]\n", damage)

    return damage
end