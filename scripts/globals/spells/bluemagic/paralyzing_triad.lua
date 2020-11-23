-----------------------------------------
-- Spell: Paralyzing Triad
-- Delivers a threefold attack. Damage varies with TP. 
-- Additional effect: Paralysis.
-- Spell cost: 33 MP
-- Monster Type: Elemental
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 6
-- Stat Bonus: HP-10 STR+4 DEX+4
-- Level: 99
-- Casting Time: 1 second
-- Recast Time: 15 seconds
-- Skillchain Element(s): Gravitation
-- Combos: Skillchain Bonus
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
		params.spellFamily = tpz.ecosystem.ELEMENTAL
        params.numhits = 3
        params.multiplier = 1.125 -- 1.00
        params.tp150 = 1.250 -- 1.375
        params.tp300 = 1.750 -- 1.75
        params.azuretp = 2.125 -- 2.25
        params.duppercap = 136
        params.str_wsc = 1.0 -- 0.5
        params.dex_wsc = 1.0 -- 0.5
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
		
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:addStatusEffect(tpz.effect.PARALYZE, 25, 0, 60)

    return damage
end