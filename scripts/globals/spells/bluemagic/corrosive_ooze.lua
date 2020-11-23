-----------------------------------------
-- Spell: Corrosive Ooze
-- Deals water damage to an enemy.
-- Additional Effect: Attack Down and Defense Down.
-- Spell cost: 55 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Water)
-- Blue Magic Points: 4
-- Stat Bonus: HP-10 MP+10
-- Level: 66
-- Casting Time: 5 seconds
-- Recast Time: 30 seconds
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
	local duration = 90
	local typeEffectOne = tpz.effect.DEFENSE_DOWN
    local typeEffectTwo = tpz.effect.ATTACK_DOWN
	local params = {}
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
        params.damageType = tpz.damageType.WIND
		params.spellFamily = tpz.ecosystem.ELEMENTAL
        params.multiplier = 2.171875
        params.tMultiplier = 1.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 71
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.4 -- 0.2
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    local resist = applyResistance(caster, target, spell, params)
	duration = duration * resist

    if (damage > 0 and resist > 0.3) then
        target:addStatusEffect(typeEffectOne, 5, 0, duration)
        target:addStatusEffect(typeEffectTwo, 5, 0, duration)
    end

    return damage
end