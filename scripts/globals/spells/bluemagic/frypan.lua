-----------------------------------------
-- Spell: Frypan
-- Delivers an area attack. Accuracy varies with TP.
-- Additional effect: "Stun."
-- Spell cost: 65 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 3
-- Stat Bonus: DEX+2
-- Level: 63
-- Casting Time: 1 seconds
-- Recast Time: 26 seconds
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
    local duration = 4
    local damage   = 0
    local params   = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
        params.tpmod       = TPMOD_ACC
        params.tpmodvalue  = 3.34 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType  = tpz.damageType.IMPACT
        params.spellFamily = tpz.ecosystem.HUMANOID
        params.numhits     = 1
        params.multiplier  = 1.77 -- fTP @    0-1500 TP
        params.tp150       = 1.77 -- fTP @ 1500-2999 TP
        params.tp300       = 1.77 -- fTP @      3000 TP
        params.azuretp     = 1.77 -- fTP @      3500 TP
        params.duppercap   = 75
        params.str_wsc     = 0.4 -- 0.2
        params.dex_wsc     = 0.0
        params.vit_wsc     = 0.0
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.4 -- 0.2
        params.chr_wsc     = 0.0

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    local resist = applyResistanceEffect(caster, target, spell, params)

    duration = duration * resist

    if resist > 0.5 then
        target:addStatusEffect(tpz.effect.STUN, 1, 0, duration)
    end

    return damage
end
