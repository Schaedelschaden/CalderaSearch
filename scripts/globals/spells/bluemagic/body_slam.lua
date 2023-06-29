-----------------------------------------
-- Spell: Body Slam
-- Delivers an area attack. Damage varies with TP.
-- Spell cost: 74 MP
-- Monster Type: Dragon
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 4
-- Stat Bonus: VIT+1, MP+5
-- Level: 62
-- Casting Time: 1 seconds
-- Recast Time: 27.75 seconds
-- Skillchain Element(s): Impaction
-- Combos: Max HP Boost
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
        params.tpmod       = TPMOD_DAMAGE
        params.tpmodvalue  = 8.33 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType  = tpz.damageType.IMPACT
        params.spellFamily = tpz.ecosystem.DRAGON
        params.numhits     = 1
        params.multiplier  = 1.50 -- fTP @    0-1500 TP
        params.tp150       = 1.50 -- fTP @ 1500-2999 TP
        params.tp300       = 1.50 -- fTP @      3000 TP
        params.azuretp     = 1.50 -- fTP @      3500 TP
        params.duppercap   = 75
        params.str_wsc     = 0.0
        params.dex_wsc     = 0.0
        params.vit_wsc     = 0.8 -- 0.4
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end
