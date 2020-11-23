-----------------------------------------
-- Spell: 1000 Needles
-- Shoots multiple needles at enemies within range.
-- Spell cost: 350 MP
-- Monster Type: Plantoid
-- Spell Type: Magical (Light)
-- Blue Magic Points: 5
-- Stat Bonus: VIT+3, AGI+3
-- Level: 62
-- Casting Time: 12 seconds
-- Recast Time: 120 seconds
-- Magic Bursts On: Transfixion, Fusion, Light
-- Combos: Beast Killer
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
        params.damageType = tpz.damageType.LIGHT
		params.spellFamily = tpz.ecosystem.PLANTOID
        params.multiplier = 5.61
        params.tMultiplier = 1.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 71
        params.str_wsc = 0.0
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