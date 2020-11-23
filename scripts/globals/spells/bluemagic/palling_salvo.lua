-----------------------------------------
-- Spell: Palling Salvo
-- Deals dark damage to enemies within range.
-- Additional effect: Bio.
-- Spell cost: 116 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 7
-- Stat Bonus: DEX+6 AGI+6
-- Level: 99
-- Casting Time: 2 second
-- Recast Time: 45 seconds
-- Magic Bursts On: Compression, Gravitation, Darkness
-- Combos: Tenacity
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
        params.damageType = tpz.damageType.DARK
		params.spellFamily = tpz.ecosystem.VERMIN
        params.multiplier = 11.00 -- 5.00
        params.tMultiplier = 1.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 1.2
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:addStatusEffect(tpz.effect.BIO, 15, 3, 90, 0, 10, 1) -- 15 HP/tick, 10% Attack Down

    return damage
end