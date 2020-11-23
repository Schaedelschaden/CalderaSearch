-----------------------------------------
-- Spell: Embalming Earth
-- Deals earth damage to enemies within range.
-- Additional effect: Slow
-- Spell cost: 57 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 6
-- Stat Bonus: STR+6
-- Level: 99
-- Casting Time: 4.5 seconds
-- Recast Time: 24 seconds
-- Magic Bursts On: Scission, Gravitation, Darkness
-- Combos: Attack Bonus
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
	local params = {}
        params.damageType = tpz.damageType.EARTH
		params.spellFamily = tpz.ecosystem.LIZARD
        params.multiplier = 9.0 -- 3.0
        params.tMultiplier = 2.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.6 -- 0.3
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:addStatusEffect(tpz.effect.SLOW, 250, 0, 180)

    return damage
end