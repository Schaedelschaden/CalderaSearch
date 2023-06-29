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
    local damage = 0
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
	-- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
        params.tpmod = TPMOD_ACC
		params.tpmodvalue = 1.67 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType = tpz.damageType.BLUNT
		params.spellFamily = tpz.ecosystem.BIRD
        params.numhits = 3
        params.multiplier = 1.125 -- fTP @    0-1500 TP
        params.tp150 = 1.2 -- fTP @ 1500-2999 TP
        params.tp300 = 1.4 -- fTP @      3000 TP
        params.azuretp = 1.5 -- fTP @      3500 TP
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
