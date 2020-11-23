-----------------------------------------
-- Spell: Polar Roar
-- Deals Ice damage to enemies within range.
-- Additional Effect: Bind.
-- Spell cost: 126 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus: 
-- Level: 95
-- Casting Time: 6 seconds
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
        params.damageType = tpz.damageType.ICE
		params.spellFamily = tpz.ecosystem.BEAST
        params.multiplier = 25.0 -- 5.0
        params.tMultiplier = 2.0
        params.duppercap = 136
        params.str_wsc = 0.4 -- 0.2
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.4 -- 0.2
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:addStatusEffect(tpz.effect.BIND, target:speed(), 0, 60)
	
	caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)

    return damage
end