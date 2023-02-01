-----------------------------------------
-- Spell: Thunderbolt
-- Deals Lightning damage to enemies within the area of effect.
-- Additional effect: "Stun." 
-- Spell cost: 138 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Lightning)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus: 
-- Level: 95
-- Casting Time: 8.5 seconds
-- Recast Time: 30 seconds
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
        params.damageType  = tpz.damageType.LIGHTNING
		params.spellFamily = tpz.ecosystem.BEAST
        params.multiplier  = 18.0 -- 4.0
        params.tMultiplier = 2.0
        params.duppercap   = 136
        params.str_wsc     = 0.0
        params.dex_wsc     = 0.0
        params.vit_wsc     = 0.0
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.6 -- 0.3
        params.mnd_wsc     = 0.4 -- 0.2
        params.chr_wsc     = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

	local duration = math.random(10, 15)
	target:addStatusEffect(tpz.effect.STUN, 1, 0, duration)
	
	caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)

    return damage
end
