-----------------------------------------
-- Spell: Mysterious Light
-- Deals wind damage to enemies within range.
-- Additional effect: Weight.
-- Spell cost: 73 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: AGI+3
-- Level: 40
-- Casting Time: 3.75 seconds
-- Recast Time: 24.5 seconds
-- Magic Bursts on: Detonation, Fragmentation, Light
-- Combos: Max MP Boost
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = 120
	local params = {}
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
        params.damageType = tpz.damageType.WIND
		params.spellFamily = tpz.ecosystem.ELEMENTAL
        params.multiplier = 0.96875
        params.tMultiplier = 1.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 56
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.6 -- 0.3
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    local resist = applyResistance(caster, target, spell, params)
	duration = duration * resist

    if (damage > 0 and resist > 0.25) then
        target:delStatusEffect(tpz.effect.WEIGHT)
        target:addStatusEffect(tpz.effect.WEIGHT, 26, 0, duration)
    end

    return damage
end