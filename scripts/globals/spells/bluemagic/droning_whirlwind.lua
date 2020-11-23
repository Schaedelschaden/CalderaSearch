-----------------------------------------
-- Spell: Droning Whirlwind
-- Deals Wind damage to enemies within area of effect.
-- Additional effect: Dispel.
-- Spell cost: 224 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus: 
-- Level: 99
-- Casting Time: 5 seconds
-- Recast Time: 30 seconds
-- Magic Bursts On: Detonation, Fragmentation, Light
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
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
        params.damageType = tpz.damageType.WIND
		params.spellFamily = tpz.ecosystem.VERMIN
        params.multiplier = 50.00 -- 4.00
        params.tMultiplier = 2.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:dispelAllStatusEffect()
	
	caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)
	
    return damage
end