-----------------------------------------
-- Spell: Crashing Thunder
-- Deals lightning damage to enemies within range.
-- Spell cost: 172 MP
-- Monster Type: Birds
-- Spell Type: Magical (Lightning)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus: 
-- Level: 95
-- Casting Time: 9 seconds
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
        params.damageType = tpz.damageType.LIGHTNING
		params.spellFamily = tpz.ecosystem.BIRD
        params.multiplier = 25 -- 6.5
        params.tMultiplier = 2.0
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.6 -- 0.3
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)

    return damage
end