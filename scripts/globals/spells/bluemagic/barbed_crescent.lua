-----------------------------------------
-- Spell: Barbed Crescent
-- Damage varies with TP.
-- Additional effect: Accuracy Down.
-- Spell cost: 52 MP
-- Monster Type: Undead
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 2
-- Stat Bonus: STR-3 DEX+4
-- Level: 99
-- Casting Time: 0.5 second
-- Recast Time: 22 seconds
-- Skillchain Element(s): Distortion, Liquefaction
-- Combos: Dual Wield
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
    local duration = BluePhysDebuffDuration(caster, 120)
    local damage = 0
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
        params.tpmod       = TPMOD_DAMAGE
        params.tpmodvalue  = 11.67 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType  = tpz.damageType.SLASHING
        params.spellFamily = tpz.ecosystem.UNDEAD
        params.numhits     = 1
        params.multiplier  = 3.75 -- fTP @    0-1500 TP
        params.tp150       = 3.75 -- fTP @ 1500-2999 TP
        params.tp300       = 3.75 -- fTP @      3000 TP
        params.azuretp     = 3.75 -- fTP @      3500 TP
        params.duppercap   = 136
        params.str_wsc     = 0.0
        params.dex_wsc     = 1.0 -- 0.5
        params.vit_wsc     = 0.0
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    target:addStatusEffect(tpz.effect.ACCURACY_DOWN, 30, 0, duration)

    return damage
end
