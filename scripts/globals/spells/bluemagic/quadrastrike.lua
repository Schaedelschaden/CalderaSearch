-----------------------------------------
-- Spell: Quadrastrike
-- Delivers a fourfold attack. Chance of critical hit varies with TP.
-- Spell cost: 98 MP
-- Monster Type: Demons
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 5
-- Stat Bonus: STR+3 CHR+3
-- Level: 96
-- Casting Time: 2 second
-- Recast Time: 42.5 seconds
-- Skillchain Element(s): Liquefaction / Scission
-- Combos: Skillchain Bonus
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
    local damage = 0
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
	-- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
        params.tpmod       = TPMOD_CRITICAL
		params.tpmodvalue  = 16.67 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.attbonus    = 25
        params.damageType  = tpz.damageType.SLASHING
		params.spellFamily = tpz.ecosystem.DEMON
        params.numhits     = 4
        params.multiplier  = 1.1875 -- fTP @    0-1500 TP
        params.tp150       = 1.1875 -- fTP @ 1500-2999 TP
        params.tp300       = 1.1875 -- fTP @      3000 TP
        params.azuretp     = 1.1875 -- fTP @      3500 TP
        params.duppercap   = 136 -- D Value upper cap. A value of 136+ applies no upper cap to the spell
        params.str_wsc     = 0.6 -- 0.3
        params.dex_wsc     = 0.0
        params.vit_wsc     = 0.0
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end
