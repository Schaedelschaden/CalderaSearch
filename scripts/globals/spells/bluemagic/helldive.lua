-----------------------------------------
-- Spell: Helldive
-- Damage varies with TP.
-- Spell cost: 16 MP
-- Monster Type: Birds
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 2
-- Stat Bonus: CHR+1, HP+5
-- Level: 16
-- Casting Time: 0.5 seconds
-- Recast Time: 11.25 seconds
-- Skillchain Property: Transfixion
-- Combos: None
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local damage = 0
	local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
		params.tpmod = TPMOD_DAMAGE
		params.tpmodvalue = 5 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType = tpz.damageType.SLASHING
		params.spellFamily = tpz.ecosystem.BIRD
        params.numhits = 1
        params.multiplier = 1.25 -- fTP @    0-1500 TP
        params.tp150 = 1.625 -- fTP @ 1500-2999 TP
        params.tp300 = 2.00 -- fTP @      3000 TP
        params.azuretp = 2.125 -- fTP @      3500 TP
        params.duppercap = 19
        params.str_wsc = 0.1
        params.dex_wsc = 0.1
        params.vit_wsc = 0.0
        params.agi_wsc = 0.6 -- 0.3
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end
