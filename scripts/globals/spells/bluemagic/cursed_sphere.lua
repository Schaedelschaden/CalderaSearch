-----------------------------------------
-- Spell: Cursed Sphere
-- Deals water damage to enemies within area of effect
-- Spell cost: 36 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Water)
-- Blue Magic Points: 2
-- Stat Bonus: MND+1
-- Level: 18
-- Casting Time: 3 seconds
-- Recast Time: 19.5 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
-- Combos: Magic Attack Bonus
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
        params.damageType = tpz.damageType.WATER
		params.spellFamily = tpz.ecosystem.VERMIN
        params.multiplier = 1.50 -- fTP
        params.tMultiplier = 1.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 30
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.6 -- 0.3
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end