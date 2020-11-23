-----------------------------------------
-- Spell: Water Bomb
-- Deals water damage to enemies within area of effect. Additional effect: Silence.
-- Spell cost: 67 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Water)
-- Blue Magic Points: 2
-- Stat Bonus: MP+20, INT+4, MND+2, STR-3, VIT-3
-- Level: 92
-- Casting Time: 3 seconds
-- Recast Time: 32 seconds
-- Magic Bursts On: Reverbration, Distortion, and Darkness
-- Combos: Conserve MP
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
        params.damageType = tpz.damageType.WATER
		params.spellFamily = tpz.ecosystem.HUMANOID
        params.multiplier = 2.775 -- 15 -- 2.775
        params.tMultiplier = 2.912 -- 15 -- 2.912
        params.duppercap = 102 -- 58
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.6 -- 0.2
        params.mnd_wsc = 0.3 -- 0.1
        params.chr_wsc = 0.0
		
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:addStatusEffect(tpz.effect.SILENCE, 1, 0, 60)

    return damage
end