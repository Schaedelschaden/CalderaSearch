-----------------------------------------
-- Spell: Frenetic Rip
-- Delivers a threefold attack. Damage varies with TP.
-- Spell cost: 61 MP
-- Monster Type: Demon
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 3
-- Stat Bonus: INT+1
-- Level: 63
-- Casting Time: 0.5 seconds
-- Recast Time: 28.5 seconds
-- Skillchain Element: Induration
-- Combos: Accuracy Bonus
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
        params.tpmod       = TPMOD_DAMAGE
        params.tpmodvalue  = 11.67 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.attbonus    = 33
        params.damageType  = tpz.damageType.IMPACT
        params.spellFamily = tpz.ecosystem.DEMON
        params.numhits     = 3
        params.multiplier  = 1.3593750 -- fTP @    0-1500 TP
        params.tp150       = 2.0703125 -- fTP @ 1500-2999 TP
        params.tp300       = 2.3593750 -- fTP @      3000 TP
        params.azuretp     = 2.6093750 -- fTP @      3500 TP
        params.duppercap   = 75
        params.str_wsc     = 0.4 -- 0.2
        params.dex_wsc     = 0.4 -- 0.2
        params.vit_wsc     = 0.0
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end
