-----------------------------------------
-- Spell: Barbed Crescent
-- Damage varies with TP. 
-- Additional effect: Accuracy Down.
-- Spell cost: 52 MP
-- Monster Type: Undead
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 2
-- Stat Bonus: STR-3 DEX+4
-- Level: 99
-- Casting Time: 0.5 second
-- Recast Time: 22 seconds
-- Skillchain Element(s): Distortion, Liquefaction
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
        params.damageType = tpz.damageType.SLASHING
		params.spellFamily = tpz.ecosystem.UNDEAD
        params.numhits = 1
        params.multiplier = 3.00 -- 1.00
        params.tp150 = 3.375 -- 1.375
        params.tp300 = 3.75 -- 1.75
        params.azuretp = 4.25 -- 2.25
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 1.0 -- 0.5
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
		
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:addStatusEffect(tpz.effect.ACCURACY_DOWN, 30, 0, 120)

    return damage
end