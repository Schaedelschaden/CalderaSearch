-----------------------------------------
-- Spell: Blazing Bound
-- Deals fire damage to an enemy.
-- Spell cost: 113 MP
-- Monster Type: Vorageans
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 3
-- Stat Bonus: VIT +2 AGI +1
-- Level: 80
-- Casting Time: 6 seconds
-- Recast Time: 30 seconds
-- Magic Bursts On: Liquefaction, Fusion, and Light
-- Combos: Dual Wield
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
		params.spellFamily = tpz.ecosystem.VORAGEAN
        params.multiplier = 3.0
        params.tMultiplier = 2.0
        params.duppercap = 136
        params.str_wsc = 0.6 -- 0.3
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, MDEF_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end