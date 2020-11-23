-----------------------------------------
-- Spell: Charged Whisker
-- Deals Lightning damage to enemies within area of effect.
-- Spell cost: 183 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Lightning)
-- Blue Magic Points: 4
-- Stat Bonus: HP-10 DEX+2 INT+2
-- Level: 88
-- Casting Time: 5 seconds
-- Recast Time: 85 seconds
-- Magic Bursts On: Impaction, Fragmentation, Light
-- Combos: Gilfinder / Treasure Hunter
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
        params.damageType = tpz.damageType.LIGHTNING
		params.spellFamily = tpz.ecosystem.BEAST
        params.multiplier = 4.5
        params.tMultiplier = 2.0
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 1.0 -- 0.5
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end