-----------------------------------------
-- Spell: Nectarous Deluge
-- Deals water damage to enemies within range.
-- Additional effect: Poison. 
-- Spell cost: 97 MP
-- Monster Type: Plantoids
-- Spell Type: Magical (Water)
-- Blue Magic Points: 6
-- Stat Bonus: MND+8
-- Level: 99
-- Casting Time: 3 second
-- Recast Time: 45 seconds
-- Magic Bursts On: Reverbration, Distortion, Darkness
-- Combos: Beast Killer
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
        params.damageType = tpz.damageType.WATER
		params.spellFamily = tpz.ecosystem.PLANTOID
        params.multiplier = 9.00 -- 3.00
        params.tMultiplier = 2.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.6 -- 0.3
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:addStatusEffect(tpz.effect.POISON, 80, 0, 60)

    return damage
end