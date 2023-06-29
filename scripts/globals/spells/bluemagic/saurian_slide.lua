-----------------------------------------
-- Spell: Saurian Slide
-- Damage varies with TP.
-- Additional effect: Weakens attacks.
-- Spell cost: 109 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 7
-- Stat Bonus: HP+50 VIT+6 INT-3
-- Level: 99
-- Casting Time: 0.5 second
-- Recast Time: 35 seconds
-- Skillchain Element(s): Fragmentation / Distortion
-- Combos: Inquartata
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
    local duration = BluePhysDebuffDuration(caster, 60)
    local damage   = 0
    local params   = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
        params.tpmod       = TPMOD_DAMAGE
        params.tpmodvalue  = 100 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType  = tpz.damageType.SLASHING
        params.spellFamily = tpz.ecosystem.HUMANOID
        params.attbonus    = 50 -- +50% Attack
        params.numhits     = 1
        params.multiplier  = 1.75 -- fTP @    0-1500 TP
        params.tp150       = 2.05 -- fTP @ 1500-2999 TP
        params.tp300       = 2.35 -- fTP @      3000 TP
        params.azuretp     = 2.65 -- fTP @      3500 TP
        params.duppercap   = 136
        params.str_wsc     = 0.0
        params.dex_wsc     = 0.0
        params.vit_wsc     = 1.2 -- 0.6
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    target:addStatusEffect(tpz.effect.ATTACK_DOWN, 25, 0, duration)

    return damage
end
