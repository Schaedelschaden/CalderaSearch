-----------------------------------------
-- Spell: Leafstorm
-- Deals wind damage within area of effect. 
-- Spell cost: 132 MP
-- Monster Type: Plantoids
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: MP +3 MND +1 CHR +1
-- Level: 77
-- Casting Time: 7 seconds
-- Recast Time: 62 seconds
-- Magic Bursts On: Detonation, Fragmentation, and Light
-- Combos: Magic Burst Bonus
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
        params.damageType = tpz.damageType.WIND
		params.spellFamily = tpz.ecosystem.PLANTOID
        params.multiplier = 2.75
        params.tMultiplier = 2.0
        params.duppercap = 136
        params.str_wsc = 0.6 -- 0.3
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end