-----------------------------------------
-- Spell: Vanity Dive
-- Damage varies with TP.
-- Spell cost: 58 MP
-- Monster Type: Empty
-- Spell Type: Physical (Impact)
-- Blue Magic Points: 2
-- Stat Bonus: AGI+2 CHR-2
-- Level: 82
-- Casting Time: 0.5 second
-- Recast Time: 40 seconds
-- Skillchain Element(s): Scission
-- Combos: Accuracy Bonus
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
        params.tpmod       = TPMOD_DAMAGE
        params.tpmodvalue  = 8.34 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType  = tpz.damageType.IMPACT
        params.spellFamily = tpz.ecosystem.EMPTY
        params.attbonus    = 66 -- +66% Attack
        params.accbonus    = math.random(2, 3) -- +6-10% Accuracy
        params.numhits     = 1
        params.multiplier  = 3.00 -- fTP @    0-1500 TP
        params.tp150       = 4.00 -- fTP @ 1500-2999 TP
        params.tp300       = 4.50 -- fTP @      3000 TP
        params.azuretp     = 4.75 -- fTP @      3500 TP
        params.duppercap   = 136 -- D Value upper cap. A value of 136+ applies no upper cap to the spell
        params.str_wsc     = 0.0
        params.dex_wsc     = 1.0 -- 0.5
        params.vit_wsc     = 0.0
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end
