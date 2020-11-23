-----------------------------------------
-- Spell: Benthic Typhoon
-- Delivers an area attack that lowers target's defense and magic defense. Damage varies with TP.
-- Spell cost: 56 MP
-- Monster Type: Vorageans
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 4
-- Stat Bonus: STR+2 VIT+2 DEX-1 AGI-1
-- Level: 83
-- Casting Time: 0.5 seconds
-- Recast Time: 55 seconds
-- Skillchain Element(s): Gravitation / Transfixion
-- Combos: Skillchain Bonus
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.tpmod = TPMOD_DAMAGE
		params.tpmodvalue = 10
        params.damageType = tpz.damageType.PIERCING
		params.spellFamily = tpz.ecosystem.VORAGEAN
        params.numhits = 1
        params.multiplier = 4.0
        params.tp150 = 4.5
        params.tp300 = 5.0
        params.azuretp = 5.25
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 1.2 -- 0.6
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:addStatusEffect(tpz.effect.DEFENSE_DOWN, 10, 0, 60)
	target:addStatusEffect(tpz.effect.MAGIC_DEF_DOWN, 10, 0, 60)

    return damage
end