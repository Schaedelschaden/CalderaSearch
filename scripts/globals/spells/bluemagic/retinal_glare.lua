-----------------------------------------
-- Spell: Retinal Glare
-- Deals light damage to enemies in a fan-shaped area originating from the caster.
-- Additional effect: Flash. 
-- Spell cost: 26 MP
-- Monster Type: Plantoid
-- Spell Type: Magical (Light)
-- Blue Magic Points: 4
-- Stat Bonus: MP+15 INT+3
-- Level: 99
-- Casting Time: 1 second
-- Recast Time: 45 seconds
-- Magic Bursts On: Transfixion, Fusion, Light
-- Combos: Conserve MP
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
		params.spellFamily = tpz.ecosystem.PLANTOID
        params.multiplier = 8.25 -- 2.75
        params.tMultiplier = 2.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.6 -- 0.3
        params.mnd_wsc = 0.2 -- 0.1
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:addStatusEffect(tpz.effect.FLASH, 200, 0, 15)

    return damage
end