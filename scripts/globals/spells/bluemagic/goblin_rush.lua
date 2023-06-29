-----------------------------------------
-- Spell: Goblin Rush
-- Delivers a threefold attack. Accuracy varies with TP.
-- Spell cost: 76 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (IMPACT)
-- Blue Magic Points: 3
-- Stat Bonus: HP+10 DEX+2 MND-3
-- Level: 81
-- Casting Time: 0.5 second
-- Recast Time: 25.5 seconds
-- Skillchain Element(s): Fusion / Impaction
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
        params.tpmod       = TPMOD_ACC
        params.tpmodvalue  = 3.34 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType  = tpz.damageType.IMPACT
        params.spellFamily = tpz.ecosystem.HUMANOID
        params.attbonus    = 33 -- +33% Attack
        params.numhits     = 3
        params.multiplier  = 1.25 -- D Value Multiplier -- fTP @    0-1500 TP
        params.tp150       = 1.25 -- fTP @ 1500-2999 TP
        params.tp300       = 1.25 -- fTP @      3000 TP
        params.azuretp     = 1.25 -- fTP @      3500 TP
        params.duppercap   = 136 -- D Value upper cap. A value of 136+ applies no upper cap to the spell
        params.str_wsc     = 0.6 -- 0.3
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
