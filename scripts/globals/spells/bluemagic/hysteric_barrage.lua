-----------------------------------------
-- Spell: Hysteric Barrage
-- Delivers a fivefold attack. Damage varies with TP.
-- Spell cost: 61 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (H2H)
-- Blue Magic Points: 5
-- Stat Bonus: DEX+2, AGI+1
-- Level: 69
-- Casting Time: 0.5 seconds
-- Recast Time: 28.5 seconds
-- Skillchain Element: Detonation
-- Combos: Evasion Bonus
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
        params.tpmodvalue  = 16.67 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType  = tpz.damageType.HTH
        params.spellFamily = tpz.ecosystem.UNDEAD
        params.attbonus    = -10 -- 10% Attack penalty
        params.numhits     = 5
        params.multiplier  = 1.250 -- fTP @    0-1500 TP
        params.tp150       = 1.625 -- fTP @ 1500-2999 TP
        params.tp300       = 1.750 -- fTP @      3000 TP
        params.azuretp     = 1.875 -- fTP @      3500 TP
        params.duppercap   = 80
        params.str_wsc     = 0.0
        params.dex_wsc     = 0.6 -- 0.3
        params.vit_wsc     = 0.0
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end
