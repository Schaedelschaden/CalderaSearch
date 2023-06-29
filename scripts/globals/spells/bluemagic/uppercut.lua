-----------------------------------------
-- Spell: Uppercut
-- Damage varies with TP
-- Spell cost: 31 MP
-- Monster Type: Plantoids
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 3
-- Stat Bonus: STR+2, DEX+1
-- Level: 38
-- Casting Time: 0.5 seconds
-- Recast Time: 17.75 seconds
-- Skillchain Element(s): Liquefaction
-- Combos: Attack Bonus
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
		params.tpmodvalue = 6.67 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType = tpz.damageType.IMPACT
		params.spellFamily = tpz.ecosystem.PLANTOID
        params.numhits = 1
        params.multiplier = 1.50 -- fTP @    0-1500 TP
        params.tp150 = 1.50 -- fTP @ 1500-2999 TP
        params.tp300 = 1.50 -- fTP @      3000 TP
        params.azuretp = 1.50 -- fTP @      3500 TP
        params.duppercap = 39
        params.str_wsc = 0.7 -- 0.35
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end