-----------------------------------------
-- Spell: Everyone's Grudge
-- Deals dark damage to an enemy.
-- Spell cost: 185 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 4
-- Stat Bonus: INT+2 MND+2 STR-1 VIT-1
-- Level: 90
-- Casting Time: 5.5 seconds
-- Recast Time: 70 seconds
-- Magic Bursts On: Compression, Gravitation, Darkness
-- Combos: Gilfinder / Treasure Hunter
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
        params.damageType = tpz.damageType.DARK
		params.spellFamily = tpz.ecosystem.HUMANOID
        params.multiplier = 5 -- 4.5
        params.tMultiplier = 2.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.8 -- 0.4
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end