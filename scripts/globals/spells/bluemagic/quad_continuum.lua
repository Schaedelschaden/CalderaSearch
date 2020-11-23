-----------------------------------------
-- Spell: Quadratic Continuum
-- Delivers a fourfold attack. Damage varies with TP. 
-- Spell cost: 91 MP
-- Monster Type: Empty
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 4
-- Stat Bonus: DEX+3 CHR -2
-- Level: 85
-- Casting Time: 1 second
-- Recast Time: 31.75 seconds
-- Skillchain Element(s): Distortion, Scission
-- Combos: Dual Wield
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
	-- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * Multiplier
		params.tpmod = TPMOD_DAMAGE
		params.tpmodvalue = 35
        params.damageType = tpz.damageType.PIERCING
		params.spellFamily = tpz.ecosystem.EMPTY
        params.numhits = 4
        params.multiplier = 1.25 -- 0~1499 TP, D Value Multiplier
        params.tp150 = 1.50 -- 1500~2999 TP
        params.tp300 = 1.75 -- 3000 TP
        params.azuretp = 2.00 -- 3500 TP/Azure Lore TP modifier
        params.duppercap = 136 -- D Value upper cap. A value of 136+ applies no upper cap to the spell
        params.str_wsc = 0.64 -- 0.32
        params.dex_wsc = 0.0
        params.vit_wsc = 0.64 -- 0.32
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end