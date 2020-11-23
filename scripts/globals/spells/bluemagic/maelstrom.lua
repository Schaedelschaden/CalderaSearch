-----------------------------------------
-- Spell: Maelstrom
-- Deals water damage to enemies within range.
-- Additional effect: STR Down.
-- Spell cost: 162 MP
-- Monster Type: Aquans
-- Spell Type: Magical (Water)
-- Blue Magic Points: 5
-- Stat Bonus: Mind +2
-- Level: 61
-- Casting Time: 6 seconds
-- Recast Time: 39 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
-- Combos: Clear Mind
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = 60
	local params = {}
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
        params.damageType = tpz.damageType.WATER
		params.spellFamily = tpz.ecosystem.AQUAN
        params.multiplier = 2.375
        params.tMultiplier = 1.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 75
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.6 -- 0.3
        params.mnd_wsc = 0.2 -- 0.1
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    local resist = applyResistance(caster, target, spell, params)

    if (damage > 0 and resist > 0.0625) then
        if (target:canGainStatusEffect(tpz.effect.STR_DOWN)) then
            target:addStatusEffect(tpz.effect.STR_DOWN, 20, 0, duration)
        end
    end

    return damage
end