-----------------------------------------
-- Spell: Battle Dance
-- Delivers an area attack. Duration of effect varies with TP.
-- Additional effect: DEX Down.
-- Spell cost: 12 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 3
-- Stat Bonus: DEX+2
-- Level: 12
-- Casting Time: 1 second
-- Recast Time: 10 seconds
-- Skillchain Element(s): Impaction
-- Combos: Attack Bonus
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
        params.damageType  = tpz.damageType.SLASHING
        params.spellFamily = tpz.ecosystem.HUMANOID
        params.numhits     = 1
        params.multiplier  = 2.00 -- fTP @    0-1500 TP
        params.tp150       = 2.00 -- fTP @ 1500-2999 TP
        params.tp300       = 2.00 -- fTP @      3000 TP
        params.azuretp     = 2.00 -- fTP @      3500 TP
        params.duppercap   = 17
        params.str_wsc     = 0.6 -- 0.3
        params.dex_wsc     = 0.0
        params.vit_wsc     = 0.0
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    target:addStatusEffect(tpz.effect.DEX_DOWN, 15, 0, duration)

    -- Wipes all shadows
    target:delStatusEffect(tpz.effect.BLINK)
    target:delStatusEffect(tpz.effect.COPY_IMAGE)
    target:delStatusEffect(tpz.effect.THIRD_EYE)

    return damage
end
