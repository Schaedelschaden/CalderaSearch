-----------------------------------------
-- Spell: Frenetic Rip
-- Delivers a threefold attack. Damage varies with TP.
-- Spell cost: 61 MP
-- Monster Type: Demon
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 3
-- Stat Bonus: INT+1
-- Level: 63
-- Casting Time: 0.5 seconds
-- Recast Time: 28.5 seconds
-- Skillchain Element: Induration
-- Combos: Accuracy Bonus
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
		params.tpmod = TPMOD_DAMAGE
		params.tpmodvalue = 35
        params.damageType = tpz.damageType.IMPACT
		params.spellFamily = tpz.ecosystem.DEMON
        params.numhits = 3
        params.multiplier = 1.359375
        params.tp150 = 2.0703125
        params.tp300 = 2.359375
        params.azuretp = 2.609375
        params.duppercap = 75
        params.str_wsc = 0.4 -- 0.2
        params.dex_wsc = 0.4 -- 0.2
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end