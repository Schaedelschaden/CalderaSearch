-----------------------------------------
-- Spell: Sweeping Gouge
-- Delivers a twofold attack. Duration of effect varies with TP.
-- Additional effect: Weakens defense.
-- Spell cost: 29 MP
-- Monster Type: Beasts
-- Spell Type: Physical (Impact)
-- Blue Magic Points: 6
-- Stat Bonus: HP+25 VIT+5
-- Level: 99
-- Casting Time: 0.5 second
-- Recast Time: 120 seconds
-- Skillchain Element(s):
-- Combos: Lizard Killer
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
    local damage   = 0
    local params   = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
        params.damageType  = tpz.damageType.IMPACT
        params.spellFamily = tpz.ecosystem.BEAST
        params.attbonus    = 90 -- +90% Attack
        params.isACrit     = true
        params.numhits     = 2
        params.multiplier  = 2.00 -- fTP @    0-1500 TP
        params.tp150       = 2.50 -- fTP @ 1500-2999 TP
        params.tp300       = 3.00 -- fTP @      3000 TP
        params.azuretp     = 3.50 -- fTP @      3500 TP
        params.duppercap   = 136
        params.str_wsc     = 0.0
        params.dex_wsc     = 0.0
        params.vit_wsc     = 0.6 -- 0.3
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    target:addStatusEffect(tpz.effect.DEFENSE_DOWN, 16, 0, duration)

    return damage
end
