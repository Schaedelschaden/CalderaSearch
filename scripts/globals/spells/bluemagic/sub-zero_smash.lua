-----------------------------------------
-- Spell: Sub-zero Smash
-- Damage varies with TP.
-- Additional Effect: Paralysis.
-- Spell cost: 44 MP
-- Monster Type: Aquans
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 4
-- Stat Bonus: HP+10 VIT+3
-- Level: 72
-- Casting Time: 1 second
-- Recast Time: 30 seconds
-- Skillchain Element(s): Fragmentation
-- Combos: Fast Cast
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
		params.tpmod = TPMOD_DAMAGE
		params.tpmodvalue = 35
        params.damageType = tpz.damageType.PIERCING
		params.spellFamily = tpz.ecosystem.AQUAN
        params.numhits = 1
        params.multiplier = 2.00
        params.tp150 = 2.00
        params.tp300 = 2.00
        params.azuretp = 2.00
        params.duppercap = 80
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 1.2 -- 0.6
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    target:addStatusEffect(tpz.effect.PARALYSIS, 10, 0, 180)

    return damage
end