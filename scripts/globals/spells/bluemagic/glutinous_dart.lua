-----------------------------------------
-- Spell: Glutinous Dart
-- Damage Varies With TP.
-- Spell cost: 16 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 2
-- Stat Bonus: HP+15 STR+3 DEX+3 INT-3
-- Level: 99
-- Casting Time: 1 second
-- Recast Time: 6 seconds
-- Skillchain Element(s): Fragmentation
-- Combos: Max HP Boost
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
		params.spellFamily = tpz.ecosystem.HUMANOID
        params.numhits = 1
        params.multiplier = 3.00 -- 1.00
        params.tp150 = 4.00 -- 2.00
        params.tp300 = 5.00 -- 3.00
        params.azuretp = 6.50 -- 5.00
        params.duppercap = 136
        params.str_wsc = 1.0 -- 0.5
        params.dex_wsc = 0.0
        params.vit_wsc = 1.0 -- 0.5
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
		
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end