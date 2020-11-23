-----------------------------------------
-- Spell: Tenebral Crush
-- Deals dark damage to enemies within range.
-- Additional effect: Weakens defense.
-- Spell cost: 116 MP
-- Monster Type: Elementals
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 8
-- Stat Bonus: MP+30 VIT+4 INT+4 MND+4
-- Level: 99
-- Casting Time: 5 second
-- Recast Time: 60 seconds
-- Magic Bursts On: Compression, Gravitation, Darkness
-- Combos: Magic Accuracy Bonus
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
        params.damageType = tpz.damageType.DARK
		params.spellFamily = tpz.ecosystem.ELEMENTAL
        params.multiplier = 9.75 -- 4.00
        params.tMultiplier = 2.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.6 -- 0.3
        params.agi_wsc = 0.0
        params.int_wsc = 0.6 -- 0.3
        params.mnd_wsc = 0.6 -- 0.3
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:addStatusEffect(tpz.effect.DEFENSE_DOWN, 20, 0, 180)

    return damage
end