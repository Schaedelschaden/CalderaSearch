-----------------------------------------
-- Spell: Sub-zero Smash
-- Damage varies with TP.
-- Additional Effect: Paralysis.
-- Spell cost: 44 MP
-- Monster Type: Aquans
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 4
-- Stat Bonus: HP+10 VIT+3
-- Level: 72
-- Casting Time: 1 second
-- Recast Time: 30 seconds
-- Skillchain Element(s): Fragmentation
-- Combos: Fast Cast
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
        params.damageType  = tpz.damageType.PIERCING
        params.spellFamily = tpz.ecosystem.AQUAN
        params.numhits     = 1
        params.multiplier  = 2.00 -- fTP @    0-1500 TP
        params.tp150       = 2.00 -- fTP @ 1500-2999 TP
        params.tp300       = 2.00 -- fTP @      3000 TP
        params.azuretp     = 2.00 -- fTP @      3500 TP
        params.duppercap   = 80
        params.str_wsc     = 0.0
        params.dex_wsc     = 0.0
        params.vit_wsc     = 1.2 -- 0.6
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    target:addStatusEffect(tpz.effect.PARALYSIS, 10, 0, 180)

    return damage
end
