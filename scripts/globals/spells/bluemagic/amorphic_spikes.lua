-----------------------------------------
-- Spell: Amorphic Spikes
-- Delivers a fivefold attack. Damage varies with TP.
-- Spell cost: 79 MP
-- Monster Type: Amorphs
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 4
-- Stat Bonus: INT+5 MND+2
-- Level: 98
-- Casting Time: 0.5 second
-- Recast Time: 58.25 seconds
-- Skillchain Element(s): Gravitation, Transfixion
-- Combos: Gilfinder / Treasure Hunter
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
        params.tpmodvalue  = 11.67 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType  = tpz.damageType.PIERCING
        params.spellFamily = tpz.ecosystem.AMORPH
        params.attbonus    = 15
        params.numhits     = 5
        params.multiplier  = 1.000 -- fTP @    0-1500 TP
        params.tp150       = 1.375 -- fTP @ 1500-2999 TP
        params.tp300       = 1.750 -- fTP @      3000 TP
        params.azuretp     = 2.250 -- fTP @      3500 TP
        params.duppercap   = 136 -- D Value upper cap. A value of 136+ applies no upper cap to the spell
        params.str_wsc     = 0.0
        params.dex_wsc     = 0.4 -- 0.2
        params.vit_wsc     = 0.0
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.4 -- 0.2
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0

        if
            caster:hasStatusEffect(tpz.effect.CHAIN_AFFINITY) or
            caster:hasStatusEffect(tpz.effect.EFFLUX)
        then
            params.attbonus = 70
        end

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end
