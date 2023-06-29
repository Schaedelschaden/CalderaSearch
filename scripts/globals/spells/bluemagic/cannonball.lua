-----------------------------------------
-- Spell: Cannonball
-- Damage varies with TP.
-- Spell cost: 66 MP
-- Monster Type: Vermin
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 3
-- Stat Bonus: STR+1, DEX+1
-- Level: 70
-- Casting Time: 0.5 seconds
-- Recast Time: 28.5 seconds
-- Skillchain Element(s): Fusion
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
        params.tpmod       = TPMOD_DAMAGE
        params.tpmodvalue  = 16.67 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.statMod     = DEF_BASED
        params.damageType  = tpz.damageType.HTH
        params.spellFamily = tpz.ecosystem.VERMIN
        params.numhits     = 1
        params.multiplier  = 1.750 -- fTP @    0-1500 TP
        params.tp150       = 2.125 -- fTP @ 1500-2999 TP
        params.tp300       = 2.750 -- fTP @      3000 TP
        params.azuretp     = 2.875 -- fTP @      3500 TP
        params.duppercap   = 75
        params.str_wsc     = 1.0 -- 0.5
        params.dex_wsc     = 0.0
        params.vit_wsc     = 1.0 -- 0.5
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end
