-----------------------------------------
-- Spell: Molting Plumage
-- Deals wind damage to enemies within a fan-shape in front of the caster.
-- Spell cost: 146 MP
-- Monster Type: Birds
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 6
-- Stat Bonus: AGI+8
-- Level: 99
-- Casting Time: 1 second
-- Recast Time: 25 seconds
-- Magic Bursts On: Detonation, Fragmentation, Light
-- Combos: Dual Wield
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
		params.spellFamily = tpz.ecosystem.BIRD
        params.multiplier = 12.00 -- 4.00
        params.tMultiplier = 2.0 -- dINT/dMND/dCHR multiplier
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

    return damage
end