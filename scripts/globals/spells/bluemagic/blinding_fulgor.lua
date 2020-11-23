-----------------------------------------
-- Spell: Blinding Fulgor
-- Deals light damage to enemies within range.
-- Additional effect: Flash. 
-- Spell cost: 116 MP
-- Monster Type: Elemental
-- Spell Type: Magical (Light)
-- Blue Magic Points: 8
-- Stat Bonus: HP+40 STR+4 DEX+4 AGI +4
-- Level: 99
-- Casting Time: 5 seconds
-- Recast Time: 60 seconds
-- Magic Bursts On: Transfixion, Fusion, Light
-- Combos: Magic Evasion Bonus
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
	local duration = math.random(10, 18)
	local params = {}
        params.damageType = tpz.damageType.LIGHT
		params.spellFamily = tpz.ecosystem.ELEMENTAL
        params.multiplier = 9.75 -- 4.00
        params.tMultiplier = 2.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 136
        params.str_wsc = 0.6 -- 0.3
        params.dex_wsc = 0.6 -- 0.3
        params.vit_wsc = 0.0
        params.agi_wsc = 0.6 -- 0.3
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:addStatusEffect(tpz.effect.FLASH, 200, 0, duration)

    return damage
end