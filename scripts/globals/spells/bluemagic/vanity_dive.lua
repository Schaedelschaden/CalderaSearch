-----------------------------------------
-- Spell: Vanity Dive
-- Damage varies with TP.
-- Spell cost: 58 MP
-- Monster Type: Empty
-- Spell Type: Physical (Impact)
-- Blue Magic Points: 2
-- Stat Bonus: AGI+2 CHR-2
-- Level: 82
-- Casting Time: 0.5 second
-- Recast Time: 40 seconds
-- Skillchain Element(s): Scission
-- Combos: Accuracy Bonus
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
	-- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * Multiplier
		params.tpmod = TPMOD_DAMAGE
		params.tpmodvalue = 25
        params.damageType = tpz.damageType.IMPACT
		params.spellFamily = tpz.ecosystem.EMPTY
		params.attbonus = 66 -- +66% Attack
		params.accbonus = math.random(6,10) -- +6-10% Accuracy
        params.numhits = 1
        params.multiplier = 4.0 -- 3.0 -- D Value Multiplier
        params.tp150 = 4.0
        params.tp300 = 4.5
        params.azuretp = 4.75
        params.duppercap = 136 -- D Value upper cap. A value of 136+ applies no upper cap to the spell
        params.str_wsc = 0.0
        params.dex_wsc = 1.0 -- 0.5
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end