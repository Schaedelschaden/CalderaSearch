-----------------------------------------
-- Spell: Goblin Rush
-- Delivers a threefold attack. Accuracy varies with TP.
-- Spell cost: 76 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (IMPACT)
-- Blue Magic Points: 3
-- Stat Bonus: HP+10 DEX+2 MND-3
-- Level: 81
-- Casting Time: 0.5 second
-- Recast Time: 25.5 seconds
-- Skillchain Element(s): Fusion / Impaction
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
        params.tpmod = TPMOD_ACC
		params.tpmodvalue = 10
        params.damageType = tpz.damageType.IMPACT
		params.spellFamily = tpz.ecosystem.HUMANOID
		params.attbonus = 33 -- +33% Attack
        params.numhits = 3
        params.multiplier = 2.5 -- D Value Multiplier
        params.tp150 = 1.25
        params.tp300 = 1.50
        params.azuretp = 1.75
        params.duppercap = 136 -- D Value upper cap. A value of 136+ applies no upper cap to the spell
        params.str_wsc = 0.6 -- 0.3
        params.dex_wsc = 0.6 -- 0.3
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end