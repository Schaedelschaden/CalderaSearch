-----------------------------------------
-- Spell: Gates of Hades
-- Deals fire damage to enemies within area of effect.
-- Additional effect: "Burn." 
-- Spell cost: 156 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus: 
-- Level: 97
-- Casting Time: 3.5 seconds
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
        params.damageType = tpz.damageType.FIRE
		params.spellFamily = tpz.ecosystem.BEAST
        params.multiplier = 30.0 -- 4.0
        params.tMultiplier = 1.0
        params.duppercap = 136
        params.str_wsc = 0.4 -- 0.2
        params.dex_wsc = 0.4 -- 0.2
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:addStatusEffect(tpz.effect.BURN, 22, 0, 90)
	
	caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)

    return damage
end