-----------------------------------------
-- Spell: Mandibular Bite
-- Damage varies with TP.
-- Spell cost: 38 MP
-- Monster Type: Vermin
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 2
-- Stat Bonus: INT+1
-- Level: 44
-- Casting Time: 0.5 seconds
-- Recast Time: 19.25 seconds
-- Skillchain property(ies): Induration
-- Combos: Plantoid Killer
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
		params.tpmodvalue = 25
        params.damageType = tpz.damageType.SLASHING
		params.spellFamily = tpz.ecosystem.VERMIN
        params.numhits = 1
        params.multiplier = 2.00
        params.tp150 = 2.00
        params.tp300 = 2.00
        params.azuretp = 2.00
        params.duppercap = 61
        params.str_wsc = 0.4 -- 0.2
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.4 -- 0.2
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end