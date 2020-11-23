-----------------------------------------
-- Spell: Thunder Breath
-- Deals thunder breath damage to enemies within a fan-shaped area originating from the caster.
-- Spell cost: 193 MP
-- Monster Type: Dragon
-- Spell Type: Breath (Thunder)
-- Blue Magic Points: 4
-- Stat Bonus: STR+2 DEX+2
-- Level: 97
-- Casting Time: 7 seconds
-- Recast Time: 56 seconds
-- Magic Bursts On: Impaction, Fragmentation, Light
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
		params.damageType = tpz.damageType.THUNDER
		params.spellFamily = tpz.ecosystem.DRAGON
		params.hpMod = 50 -- 50%
		params.lvlMod = 0.075 -- fLV
		params.bonus = 1.00 -- +% Base Damage Bonus
		params.multiplier = 1.50 -- Azure Lore Damage multiplier
	
	local damage = BlueBreathSpell(caster, target, spell, params)
	damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end