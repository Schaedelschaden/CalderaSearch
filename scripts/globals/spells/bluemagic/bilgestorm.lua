-----------------------------------------
-- Spell: Bilgestorm
-- Deals damage in an area of effect.
-- Additional effect: Lowers attack, accuracy, and defense.
-- Spell cost: 122 MP
-- Monster Type: Demons
-- Spell Type: Physical (Impact)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus:
-- Level: 99
-- Casting Time: 1 second
-- Recast Time: 30 seconds
-- Skillchain Element(s): Darkness / Gravitation
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
    local randomize
    local chance    = 75
    local duration  = 120
    local damage    = 0
    local params    = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
        params.damageType  = tpz.damageType.IMPACT
        params.spellFamily = tpz.ecosystem.DEMON
        params.numhits     = 1
        params.multiplier  = 5.00 -- fTP @    0-1500 TP
        params.tp150       = 5.33 -- fTP @ 1500-2999 TP
        params.tp300       = 5.75 -- fTP @      3000 TP
        params.azuretp     = 6.25 -- fTP @      3500 TP
        params.duppercap   = 136
        params.str_wsc     = 0.0
        params.dex_wsc     = 0.0
        params.vit_wsc     = 0.0
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.6 -- 0.3
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 1.2 -- 0.6

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    if math.random(0, 100) < chance then
        randomize = math.random(0, 50)
        duration = duration * (1 - randomize)
        target:addStatusEffect(tpz.effect.ATTACK_DOWN, 25, 0, duration)
    end

    if math.random(0, 100) < chance then
        randomize = math.random(0, 50)
        duration = duration * (1 - randomize)
        target:addStatusEffect(tpz.effect.ACCURACY_DOWN, 50, 0, duration)
    end

    if math.random(0, 100) < chance then
        randomize = math.random(0, 50)
        duration = duration * (1 - randomize)
        target:addStatusEffect(tpz.effect.DEFENSE_DOWN, 25, 0, duration)
    end

    caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)

    return damage
end
