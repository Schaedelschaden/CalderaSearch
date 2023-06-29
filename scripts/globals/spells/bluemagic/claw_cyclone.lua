-----------------------------------------
-- Spell: Claw Cyclone
-- Damages enemies within area of effect with a twofold attack. Damage varies with TP
-- Spell cost: 24 MP
-- Monster Type: Beasts
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 2
-- Stat Bonus: VIT+1
-- Level: 20
-- Casting Time: 1 seconds
-- Recast Time: 19.75 seconds
-- Skillchain Element(s): Scission
-- Combos: Lizard Killer
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
        params.tpmod       = TPMOD_ATTACK
        params.tpmodvalue  = 30 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType  = tpz.damageType.SLASHING
        params.spellFamily = tpz.ecosystem.BEAST
        params.numhits     = 2
        params.multiplier  = 1.4375 -- fTP @    0-1500 TP
        params.tp150       = 1.4375 -- fTP @ 1500-2999 TP
        params.tp300       = 1.4375 -- fTP @      3000 TP
        params.azuretp     = 1.4375 -- fTP @      3500 TP
        params.duppercap   = 23
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
