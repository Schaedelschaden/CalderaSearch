-----------------------------------------
-- Spell: Vapor Spray
-- Deals Water breath damage to enemies within a fan-shaped area originating from the caster.
-- Spell cost: 172 MP
-- Monster Type: Luminians
-- Spell Type: Magical (Water)
-- Blue Magic Points: 3
-- Stat Bonus: HP+15 VIT+4
-- Level: 96
-- Casting Time: 3 seconds
-- Recast Time: 56 seconds
-- Magic Bursts On: Reverbration, Distortion, Darkness
-- Combos: Max MP Boost
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
		params.damageType = tpz.damageType.WATER
		params.spellFamily = tpz.ecosystem.LUMINIAN
		params.hpMod = 50 -- 50%
		params.lvlMod = 0.08 -- fLV
		params.bonus = 1.00 -- % Damage Bonus
		params.multiplier = 1.50 -- Azure Lore Damage multiplier
	
	local damage = BlueBreathSpell(caster, target, spell, params)
	damage = BlueFinalAdjustments(caster, target, spell, damage, params)
--	printf("Vapor Spray onSpellCast DAMAGE: [%i]\n", damage)

    return damage
end