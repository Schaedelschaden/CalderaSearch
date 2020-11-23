-----------------------------------------
-- Spell: Jet Stream
-- Delivers a threefold attack. Accuracy varies with TP.
-- Spell cost: 47 MP
-- Monster Type: Birds
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 4
-- Stat Bonus: DEX+2
-- Level: 38
-- Casting Time: 0.5 seconds
-- Recast Time: 23 seconds
-- Skillchain Element(s): Lightning (can open Liquefaction or Detonation can close Impaction or Fusion)
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
	-- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * Multiplier
        params.tpmod = TPMOD_ACC
		params.tpmodvalue = 5
        params.damageType = tpz.damageType.BLUNT
		params.spellFamily = tpz.ecosystem.BIRD
        params.numhits = 3
        params.multiplier = 1.125 -- D Value Multiplier
        params.tp150 = 1.2
        params.tp300 = 1.4
        params.azuretp = 1.5
        params.duppercap = 39 -- D Value upper cap. A value of 136+ applies no upper cap to the spell
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.6 -- 0.3
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end