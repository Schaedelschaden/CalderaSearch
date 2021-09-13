-----------------------------------------
-- Spell: Subduction
-- Deals Wind damage to enemies within range.
-- Additional effect: Weight.
-- Spell cost: 27 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 6
-- Stat Bonus: MP+25 VIT+6 INT+6
-- Level: 99
-- Casting Time: 0.5 second
-- Recast Time: 5 seconds
-- Magic Bursts On: Detonation, Fragmentation, Light
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
	-- local params = {}
		-- params.diff = nil
		-- params.attribute = tpz.mod.INT
		-- params.skillType = tpz.skill.BLUE_MAGIC
		-- params.bonus = 0
		-- params.effect = tpz.effect.WEIGHT
	-- local resist = applyResistanceEffect(caster, target, spell, params)
	-- printf("subduction.lua onSpellCast RESIST: [%1.2f]", resist)
	local params = {}
        params.damageType = tpz.damageType.WIND
		params.spellFamily = tpz.ecosystem.ARCANA
        params.multiplier = 4.00 -- 2.00
        params.tMultiplier = 2.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 136
        params.str_wsc = 0.2 -- 0.1
        params.dex_wsc = 0.0
        params.vit_wsc = 0.2 -- 0.1
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	-- if (resist >= 0.10) then
		-- target:addStatusEffect(tpz.effect.WEIGHT, 76, 0, 60)
	-- end

    return damage
end