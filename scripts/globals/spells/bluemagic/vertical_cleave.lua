-----------------------------------------
-- Spell: Vertical Cleave
-- Damage varies with TP
-- Spell cost: 86 MP
-- Monster Type: Luminians
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 3
-- Stat Bonus: VIT+1 HP-5 MP+5
-- Level: 75
-- Casting Time: 0.5 seconds
-- Recast Time: 37.25 seconds
-- Skillchain Element(s): Gravitation
-- Combos: Defense Bonus
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
        params.tpmodvalue  = 10 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType  = tpz.damageType.SLASHING
        params.spellFamily = tpz.ecosystem.LUMINION
        params.numhits     = 1
        params.multiplier  = 3.00 -- fTP @    0-1500 TP
        params.tp150       = 3.00 -- fTP @ 1500-2999 TP
        params.tp300       = 3.00 -- fTP @      3000 TP
        params.azuretp     = 3.00 -- fTP @      3500 TP
        params.duppercap   = 100
        params.str_wsc     = 1.0 -- 0.5
        params.dex_wsc     = 0.0
        params.vit_wsc     = 0.0
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0

    if
        caster:hasStatusEffect(tpz.effect.CHAIN_AFFINITY) or
        caster:hasStatusEffect(tpz.effect.EFFLUX)
    then
        params.attbonus = 70
    end

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end
