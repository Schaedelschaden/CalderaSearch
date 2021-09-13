-----------------------------------------
-- Spell: Sinker Drill
-- Delivers a fivefold attack. Damage varies with TP.
-- Spell cost: 91 MP
-- Monster Type: Arcana
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 6
-- Stat Bonus: STR+4 DEX+4 VIT+4
-- Level: 99
-- Casting Time: 0.5 seconds
-- Recast Time: 20 seconds
-- Skillchain Element(s): Gravitation / Reverbration
-- Combos: Critical Attack Bonus
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
	-- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * Multiplier
		params.tpmod = TPMOD_DAMAGE
		params.tpmodvalue = 35
		params.damageType = tpz.damageType.PIERCING
		params.spellFamily = tpz.ecosystem.ARCANA
		params.isACrit = false
        params.numhits = 5
        params.multiplier = 8.50
        params.tp150 = 3.5
        params.tp300 = 4.0
        params.azuretp = 5.5
        params.duppercap = 136
        params.str_wsc = 1.0 -- 0.5
        params.dex_wsc = 0.0
        params.vit_wsc = 1.0 -- 0.5
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
	damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end