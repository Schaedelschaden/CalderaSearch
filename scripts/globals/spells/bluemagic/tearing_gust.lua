-----------------------------------------
-- Spell: Tearing Gust
-- Deals Wind damage to enemies within the area of effect.
-- Additional effect: "Magic Defense Down" 
-- Spell cost: 202 MP
-- Monster Type: Elementals
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus: 
-- Level: 99
-- Casting Time: 3 seconds
-- Recast Time: 30 seconds
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
        params.damageType  = tpz.damageType.WIND
		params.spellFamily = tpz.ecosystem.ELEMENTAL
        params.multiplier  = 20.0 -- 4.0
        params.tMultiplier = 2.0
        params.duppercap   = 136
        params.str_wsc     = 0.0
        params.dex_wsc     = 0.0
        params.vit_wsc     = 0.0
        params.agi_wsc     = 0.4
        params.int_wsc     = 0.6 -- 0.3
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

	target:addStatusEffect(tpz.effect.MAGIC_DEF_DOWN, 30, 0, 60)

	caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)

    return damage
end
