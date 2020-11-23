-----------------------------------------
-- Spell: Heavy Strike
-- Damage varies with TP.
-- Spell cost: 32 MP
-- Monster Type: Arcana
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 2
-- Stat Bonus: STR+2
-- Level: 92
-- Casting Time: 1 second
-- Recast Time: 30 seconds
-- Skillchain Element(s): Fragmentation / Transfixion
-- Combos: Double Attack / Triple Attack
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
		params.tpmodvalue = 30
		params.damageType = tpz.damageType.IMPACT
		params.spellFamily = tpz.ecosystem.ARCANA
		params.isACrit = true
		params.accbonus = -(math.random(10,15))
        params.numhits = 1
        params.multiplier = 2.25
        params.tp150 = 3.5
        params.tp300 = 4.0
        params.azuretp = 5.0
        params.duppercap = 136
        params.str_wsc = 1.0 -- 0.5
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

--	printf("Heavy Strike onSpellCast ACC Bonus: [%i]\n", params.accbonus)

    return damage
end