-----------------------------------------
-- Spell: Empty Thrash
-- Delivers an area of attack attack. Accuracy varies with TP.
-- Spell cost: 33 MP
-- Monster Type: Empty
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 3
-- Stat Bonus: STR+3 CHR-2
-- Level: 87
-- Casting Time: 0.5 second
-- Recast Time: 40.75 seconds
-- Skillchain Element(s): Compression / Scission
-- Combos: Double Attack / Triple Attack
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
	-- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * Multiplier
        params.tpmod = TPMOD_ACC
		params.tpmodvalue = 40
        params.damageType = tpz.damageType.SLASHING
		params.spellFamily = tpz.ecosystem.EMPTY
        params.numhits = 1
        params.multiplier = 2.0
        params.tp150 = 2.0
        params.tp300 = 2.0
        params.azuretp = 2.0
        params.duppercap = 136
        params.str_wsc = 1.0 -- 0.5
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end