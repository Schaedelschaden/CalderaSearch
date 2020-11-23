-----------------------------------------
-- Spell: Mind Blast
-- Deals lightning damage to an enemy.
-- Additional effect: Paralysis.
-- Spell cost: 82 MP
-- Monster Type: Demons
-- Spell Type: Magical (Lightning)
-- Blue Magic Points: 4
-- Stat Bonus: MP+5 MND+1
-- Level: 73
-- Casting Time: 3 seconds
-- Recast Time: 30 seconds
-- Magic Bursts on: Impaction, Fragmentation, and Light
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
	local params = {}
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
        params.damageType = tpz.damageType.THUNDER
		params.spellFamily = tpz.ecosystem.DEMON
        params.multiplier = 2.07421875
        params.tMultiplier = 1.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 81
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.6 -- 0.3
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    local resist = applyResistance(caster, target, spell, params)
	duration = duration * resist

    if (damage > 0 and resist > 0.3) then
        target:addStatusEffect(tpz.effect.PARALYSIS, 20, 0, duration)
    end

    return damage
end