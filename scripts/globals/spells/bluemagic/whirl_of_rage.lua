-----------------------------------------
-- Spell: Whirl of Rage
-- Delivers an area attack that stuns enemies. Damage varies with TP.
-- Spell cost: 73 MP
-- Monster Type: Arcana
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 2
-- Stat Bonus: STR+2 DEX+2
-- Level: 83
-- Casting Time: 1 seconds
-- Recast Time: 30 seconds
-- Skillchain Element(s): Scission / Detonation
-- Combos: Zanshin
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
		params.tpmodvalue = 15
        params.damageType = tpz.damageType.SLASHING
		params.spellFamily = tpz.ecosystem.ARCANA
        params.numhits = 1
        params.multiplier = 3.0
        params.tp150 = 4.0
        params.tp300 = 4.0
        params.azuretp = 4.25
        params.duppercap = 50
        params.str_wsc = 0.6 -- 0.3
        params.dex_wsc = 0.6 -- 0.3
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:addStatusEffect(tpz.effect.STUN, 1, 0, 3)

    return damage
end