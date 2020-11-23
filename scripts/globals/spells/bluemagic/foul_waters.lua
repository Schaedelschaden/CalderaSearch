---------------------------------------------
-- Spell: Foul Waters
-- Deals water damage to enemies in a fan-shaped area originating from caster.
-- Additional effect: Drown. 
-- Spell cost: 76 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Water)
-- Blue Magic Points: 4
-- Stat Bonus: HP+10 VIT+4
-- Level: 99
-- Casting Time: 3.5 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Reverbration, Distortion, Darkness
-- Combos: Resist Silence
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/magic")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
	-- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * Multiplier
	local params = {}
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
		params.damageType = tpz.damageType.WATER
		params.spellFamily = tpz.ecosystem.AMORPH
        params.multiplier = 6.75 -- 2.25
        params.tMultiplier = 2.0
        params.duppercap = 136
        params.str_wsc = 0.4 -- 0.2
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.4 -- 0.2
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
    target:addStatusEffect(tpz.effect.DROWN, 31, 0, 180)

    return damage
end