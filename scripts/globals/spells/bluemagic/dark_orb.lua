-----------------------------------------
-- Spell: Dark Orb
-- Deals dark damage to an enemy.
-- Spell cost: 124 MP
-- Monster Type: Demons
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 3
-- Stat Bonus: AGI+2 MND+2
-- Level: 93
-- Casting Time: 9 seconds
-- Recast Time: 72 seconds
-- Magic Bursts On: Compression, Gravitation, Darkness
-- Combos: Counter
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
        params.damageType  = tpz.damageType.DARK
		params.spellFamily = tpz.ecosystem.DEMON
        params.multiplier  = 13.5 -- 4.5
        params.tMultiplier = 2.0 -- dINT/dMND/dCHR multiplier
        params.duppercap   = 136
        params.str_wsc     = 0.0
        params.dex_wsc     = 0.0
        params.vit_wsc     = 0.0
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.8 -- 0.4
        params.chr_wsc     = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end
