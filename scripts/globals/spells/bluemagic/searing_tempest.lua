-----------------------------------------
-- Spell: Searing Tempest
-- Deals fire damage to enemies within range. 
-- Additional effect: Burn.
-- Spell cost: 116 MP
-- Monster Type: Elementals
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 8
-- Stat Bonus: MP+30 STR+8
-- Level: 99
-- Casting Time: 5 second
-- Recast Time: 60 seconds
-- Magic Bursts On: Liquefaction, Fusion, Light
-- Combos: Attack Bonus
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
		params.spellFamily = tpz.ecosystem.ELEMENTAL
        params.multiplier = 9.75 -- 4.00
        params.tMultiplier = 2.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 136
        params.str_wsc = 1.6 -- 0.8
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:addStatusEffect(tpz.effect.BURN, 30, 0, 90)

    return damage
end