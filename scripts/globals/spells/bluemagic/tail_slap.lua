-----------------------------------------
-- Spell: Tail Slap
-- Delivers an area attack. Damage varies with TP.
-- Additional effect: "Stun."
-- Spell cost: 77 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (H2H)
-- Blue Magic Points: 4
-- Stat Bonus: MND+2
-- Level: 69
-- Casting Time: 1 seconds
-- Recast Time: 28.5 seconds
-- Skillchain Element: Reverberation
-- Combos: Store TP
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = 5
    local damage   = 0
    local params   = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
        params.diff        = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
        params.attribute   = tpz.mod.INT
        params.skillType   = tpz.skill.BLUE_MAGIC
        params.tpmod       = TPMOD_DAMAGE
        params.tpmodvalue  = 11.67 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType  = tpz.damageType.HTH
        params.spellFamily = tpz.ecosystem.HUMANOID
        params.numhits     = 1
        params.multiplier  = 1.625 -- fTP @    0-1500 TP
        params.tp150       = 1.625 -- fTP @ 1500-2999 TP
        params.tp300       = 1.625 -- fTP @      3000 TP
        params.azuretp     = 1.625 -- fTP @      3500 TP
        params.duppercap   = 75
        params.str_wsc     = 0.4 -- 0.2
        params.dex_wsc     = 0.0
        params.vit_wsc     = 1.0 -- 0.5
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
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
