-----------------------------------------
-- Spell: Magnetite Cloud
-- Deals earth damage to enemies within a fan-shaped area originating from the caster.
-- Additional effect: Weight.
-- Spell cost: 86 MP
-- Monster Type: Beastmen
-- Spell Type: Breath (Earth)
-- Blue Magic Points: 3
-- Stat Bonus: VIT+2
-- Level: 46
-- Casting Time: 4.5 seconds
-- Recast Time: 29.25 seconds
-- Magic Bursts on: Scission, Gravitation, and Darkness
-- Combos: Magic Defense Bonus
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
		params.damageType = tpz.damageType.THUNDER
		params.spellFamily = tpz.ecosystem.HUMANOID
		params.hpMod = 16 -- 50%
		params.lvlMod = 1.875 -- fLV
		params.bonus = 1.00 -- +% Base Damage Bonus
		params.multiplier = 1.50 -- Azure Lore Damage multiplier
	
	local damage = BlueBreathSpell(caster, target, spell, params)
	damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    local resist = applyResistance(caster, target, spell, params)

    if (damage > 0 and resist > 0.0625) then
        local typeEffect = tpz.effect.WEIGHT
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 26, 0, duration)
    end

    return damage
end