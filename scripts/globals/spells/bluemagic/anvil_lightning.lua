-----------------------------------------
-- Spell: Anvil Lightning
-- Deals lightning damage to enemies within range. 
-- Additional effect: Stun.
-- Spell cost: 116 MP
-- Monster Type: Elementals
-- Spell Type: Magical (Thunder)
-- Blue Magic Points: 8
-- Stat Bonus: MP+30 DEX+8
-- Level: 99
-- Casting Time: 5 second
-- Recast Time: 60 seconds
-- Magic Bursts On: Impaction, Fragmentation, Light
-- Combos: Accuracy Bonus
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	local duration = 6
	local params = {}
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
        params.damageType = tpz.damageType.THUNDER
		params.spellFamily = tpz.ecosystem.ELEMENTAL
        params.multiplier = 9.75 -- 4.00
        params.tMultiplier = 2.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 1.6 -- 0.8
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	local resist = applyResistance(caster, target, spell, params)
	duration = duration * resist
	
	if resist < 0.5 then
        return damage
    else
		target:addStatusEffect(tpz.effect.STUN, 1, 0, duration)
    end

    return damage
end