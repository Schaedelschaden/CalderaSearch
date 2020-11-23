-----------------------------------------
-- Spell: Asuran Claws
-- Delivers a sixfold attack. Accuracy varies with TP.
-- Spell cost: 81 MP
-- Monster Type: Beasts
-- Spell Type: Physical (H2H)
-- Blue Magic Points: 2
-- Stat Bonus: AGI +3
-- Level: 70
-- Casting Time: 3 seconds
-- Recast Time: 60 seconds
-- Skillchain Element(s): Liquefaction / Impaction
-- Combos: Counter
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
		params.tpmod = TPMOD_ACC
		params.tpmodvalue = 15
        params.damageType = tpz.damageType.HTH
		params.spellFamily = tpz.ecosystem.BEAST
        params.numhits = 1
        params.multiplier = 0.625
        params.tp150 = 0.625
        params.tp300 = 0.625
        params.azuretp = 0.625
        params.duppercap = 71
        params.str_wsc = 0.2 -- 0.1
        params.dex_wsc = 0.2 -- 0.1
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end