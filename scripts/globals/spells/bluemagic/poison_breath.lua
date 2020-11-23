-----------------------------------------
-- Spell: Poison Breath
-- Deals water damage to enemies within a fan-shaped area originating from the caster.
-- Additional effect: Poison.
-- Spell cost: 22 MP
-- Monster Type: Hound
-- Spell Type: Magical (Water)
-- Blue Magic Points: 1
-- Stat Bonus: MND+1
-- Level: 22
-- Casting Time: 3 seconds
-- Recast Time: 19.5 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
-- Combos: Clear Mind
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = 30
	local params = {}
		params.attackType = tpz.attackType.BREATH
		params.damageType = tpz.damageType.WATER
		params.spellFamily = tpz.ecosystem.UNDEAD
		params.hpMod = 10 -- 50%
		params.lvlMod = 1.25 -- fLV
		params.bonus = 1.00 -- +% Base Damage Bonus
		params.multiplier = 1.50 -- Azure Lore Damage multiplier
	
	local damage = BlueBreathSpell(caster, target, spell, params)
	damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:addStatusEffect(tpz.effect.POISON, 4, 0, duration)

    return damage
end