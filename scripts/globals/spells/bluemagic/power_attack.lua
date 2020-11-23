-----------------------------------------
-- Spell: Power Attack
-- Deals critical damage. Chance of critical hit varies with TP
-- Spell cost: 5 MP
-- Monster Type: Vermin
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 1
-- Stat Bonus: MND+1
-- Level: 4
-- Casting Time: 0.5 seconds
-- Recast Time: 7.25 seconds
-- Skillchain property: Reverberation
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
		params.tpmod = TPMOD_CRITICAL
		params.tpmodvalue = 11
        params.damageType = tpz.damageType.SLASHING
		params.spellFamily = tpz.ecosystem.VERMIN
        params.numhits = 1
        params.multiplier = 1.125
        params.tp150 = 1.125
        params.tp300 = 1.125
        params.azuretp = 1.125
        params.duppercap = 11
        params.str_wsc = 0.2 -- 0.1
        params.dex_wsc = 0.0
        params.vit_wsc = 0.2 -- 0.1
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end
