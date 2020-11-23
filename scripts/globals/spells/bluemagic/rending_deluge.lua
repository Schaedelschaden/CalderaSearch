---------------------------------------------
-- Spell: Rending Deluge
-- Deals water damage to enemies within range.
-- Additional effect: Dispel.
-- Spell cost: 118 MP
-- Monster Type: Aquan
-- Spell Type: Magical (Water)
-- Blue Magic Points: 6
-- Stat Bonus: VIT+6
-- Level: 99
-- Casting Time: 2 seconds
-- Recast Time: 35 seconds
-- Magic Bursts on: Reverbration, Distortion, Darkness
-- Combos: Magic Defense Bonus
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
		params.spellFamily = tpz.ecosystem.AQUAN
        params.multiplier = 10.5 -- 3.5
        params.tMultiplier = 2.0
        params.duppercap = 136
        params.str_wsc = 0.4 -- 0.2
        params.dex_wsc = 0.0
        params.vit_wsc = 0.4 -- 0.2
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
    local resist = applyResistance(caster, target, spell, params)
    if (resist > 0.0625) then
        target:dispelStatusEffect()
    end

    return damage
end