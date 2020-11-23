-----------------------------------------
-- Spell: Thermal Pulse
-- Deals Fire damage to enemies within area of effect. 
-- Additional effect: Blindness
-- Spell cost: 151 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 3
-- Stat Bonus: VIT +2
-- Level: 86
-- Casting Time: 5.5 seconds
-- Recast Time: 70 seconds
-- Magic Bursts On: Liquefaction, Fusion, and Light
-- Combos: Attack Bonus
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
        params.damageType = tpz.damageType.FIRE
		params.spellFamily = tpz.ecosystem.VERMIN
        params.multiplier = 2.75
        params.tMultiplier = 2.0
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.8 -- 0.4
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	local duration = math.random(30,60)
	target:addStatusEffect(tpz.effect.BLINDNESS, 1, 0, duration)

    return damage
end