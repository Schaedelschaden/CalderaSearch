-----------------------------------------
-- Spell: Spectral Floe
-- Deals ice damage to enemies within range.
-- Additional effect: Terror.
-- Spell cost: 116 MP
-- Monster Type: Elementals
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 8
-- Stat Bonus: MP+30 INT+8
-- Level: 99
-- Casting Time: 5 second
-- Recast Time: 60 seconds
-- Magic Bursts On: Induration, Distortion, Darkness
-- Combos: Magic Attack Bonus
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
		params.spellFamily = tpz.ecosystem.ELEMENTAL
        params.multiplier = 9.75 -- 4.00
        params.tMultiplier = 2.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 1.6 -- 0.8
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	duration = 5
	
	if (target:isNM()) then
		duration = 1
	end
	
	target:addStatusEffect(tpz.effect.TERROR, 1, 0, duration)

    return damage
end