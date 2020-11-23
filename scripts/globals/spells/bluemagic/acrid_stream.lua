-----------------------------------------
-- Spell: Acrid Stream
-- Deals water damage to enemies within a fan-shaped area originating from the caster. 
-- Additional effect: Lowers target's Magic Defense.
-- Spell cost: 89 MP
-- Monster Type: Vorageans
-- Spell Type: Magical (Water)
-- Blue Magic Points: 3
-- Stat Bonus: DEX +2, MND +2
-- Level: 77
-- Casting Time: 4 seconds
-- Recast Time: 23 seconds
-- Magic Bursts On: Reverbration, Distortion, and Darkness
-- Combos: Double Attack / Triple Attack
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
        params.damageType = tpz.damageType.WATER
		params.spellFamily = tpz.ecosystem.VORAGEAN
        params.multiplier = 2.297
        params.tMultiplier = 2.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.6 -- 0.3
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	if (target:hasStatusEffect(tpz.effect.MAGIC_DEF_DOWN)) then
		spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
	else
		target:addStatusEffect(tpz.effect.MAGIC_DEF_DOWN, 10, 0, 120)
		spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
	end

    return damage
end