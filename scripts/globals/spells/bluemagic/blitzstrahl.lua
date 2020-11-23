-----------------------------------------
-- Spell: Blitzstrahl
-- Deals lightning damage to an enemy.
-- Additional effect: "Stun".
-- Spell cost: 70 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Lightning)
-- Blue Magic Points: 4
-- Stat Bonus: DEX+3
-- Level: 44
-- Casting Time: 4.5 seconds
-- Recast Time: 29.25 seconds
-- Magic Bursts on: Impaction, Fragmentation, Light
-- Combos: None
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = 5
	local params = {}
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
        params.damageType = tpz.damageType.THUNDER
		params.spellFamily = tpz.ecosystem.ARCANA
        params.multiplier = 1.5625
        params.tMultiplier = 1.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 61
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
	duration = duration * resist

    if (damage > 0 and resist > 0.0625) then
        local typeEffect = tpz.effect.STUN
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 1, 0, duration)
    end

    return damage
end