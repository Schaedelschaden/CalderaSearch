-----------------------------------------
-- Spell: Uproot
-- Deals light damage to enemies within range. Also removes status ailments from caster.
-- Spell cost: 88 MP
-- Monster Type: Plantoid
-- Spell Type: Magical (Light)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus: 
-- Level: 99
-- Casting Time: 5 seconds
-- Recast Time: 30 seconds
-- Magic Bursts On: Transfixion, Fusion, Light
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
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
        params.damageType = tpz.damageType.LIGHT
		params.spellFamily = tpz.ecosystem.PLANTOID
        params.multiplier = 14.00 -- 4.00
        params.tMultiplier = 2.0 -- dINT/dMND/dCHR multiplier
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
	
	caster:eraseAllStatusEffect()
	
	caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)
	
	spell:setMsg(tpz.msg.basic.HIT_DMG)
	
    return damage
end