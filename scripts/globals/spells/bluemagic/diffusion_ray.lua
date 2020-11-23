-----------------------------------------
-- Spell: Diffusion Ray
-- Deals light damage to enemies within a fan-shaped area originating from caster.
-- Spell cost: 238 MP
-- Monster Type: Archaic Machines
-- Spell Type: Magical (Light)
-- Blue Magic Points: 6
-- Stat Bonus: STR+5 VIT+7
-- Level: 99
-- Casting Time: 0.5 second
-- Recast Time: 45 seconds
-- Magic Bursts On: Transfixion, Fusion, Light
-- Combos: Store TP
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
        params.damageType = tpz.damageType.LIGHT
		params.spellFamily = tpz.ecosystem.ARCHAICMACHINE
        params.multiplier = 15.00 -- 5.00
        params.tMultiplier = 1.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.8 -- 0.4
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end