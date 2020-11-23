-----------------------------------------
-- Spell: Hydro Shot
-- Chance of effect varies with TP.
-- Additional effect: Enmity Down.
-- Spell cost: 55 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (H2H)
-- Blue Magic Points: 3
-- Stat Bonus: MND+2
-- Level: 63
-- Casting Time: 0.5 seconds
-- Recast Time: 26 seconds
-- Skillchain Element(s): Reverberation
-- Combos: Rapid Shot
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
        params.damageType = tpz.damageType.HTH
		params.spellFamily = tpz.ecosystem.HUMANOID
        params.numhits = 1
        params.multiplier = 1.25
        params.tp150 = 1.25
        params.tp300 = 1.25
        params.azuretp = 1.25
        params.duppercap = 75
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.6 -- 0.3
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end