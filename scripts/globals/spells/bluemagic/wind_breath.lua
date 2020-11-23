-----------------------------------------
-- Spell: Wind Breath
-- Deals wind breath damage to enemies within a fan-shaped area originating from the caster.
-- Spell cost: 26 MP
-- Monster Type: Dragon
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 2
-- Stat Bonus: STR+2 AGI+2
-- Level: 99
-- Casting Time: 1.5 seconds
-- Recast Time: 29.5 seconds
-- Magic Bursts On: Detonation, Fragmentation, Light
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
	local params = {}
		params.attackType = tpz.attackType.BREATH
		params.damageType = tpz.damageType.WIND
		params.spellFamily = tpz.ecosystem.DRAGON
		params.hpMod = 25 -- 25%
		params.lvlMod = 0.06 -- fLV
		params.bonus = 1.00 -- +% Base Damage Bonus
		params.multiplier = 1.50 -- Azure Lore Damage multiplier
	
	local damage = BlueBreathSpell(caster, target, spell, params)
	damage = BlueFinalAdjustments(caster, target, spell, damage, params)
--	printf("Heat Breath onSpellCast DAMAGE: [%i]\n", damage)

    return damage
end