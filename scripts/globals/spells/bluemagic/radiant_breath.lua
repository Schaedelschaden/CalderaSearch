-----------------------------------------
-- Spell: Radiant Breath
-- Deals light damage to enemies within a fan-shaped area of effect originating from the caster.
-- Additional effect: Slow and Silence.
-- Spell cost: 116 MP
-- Monster Type: Wyverns
-- Spell Type: Breath (Light)
-- Blue Magic Points: 4
-- Stat Bonus: CHR+1, HP+5
-- Level: 54
-- Casting Time: 5.25 seconds
-- Recast Time: 33.75 seconds
-- Magic Bursts on: Transfixion, Fusion, Light
-- Combos: None
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	local duration = 90
	local params = {}
		params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
		params.attackType = tpz.attackType.BREATH
		params.damageType = tpz.damageType.THUNDER
		params.spellFamily = tpz.ecosystem.DRAGON
		params.hpMod = 50 -- 50%
		params.lvlMod = 0.075 -- fLV
		params.bonus = 1.00 -- +% Base Damage Bonus
		params.multiplier = 1.50 -- Azure Lore Damage multiplier
	
	local damage = BlueBreathSpell(caster, target, spell, params)
	damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    local resist = applyResistance(caster, target, spell, params)
	duration = duration * resist

    if (damage > 0 and resist > 0.3) then
    local typeEffect = tpz.effect.SLOW
        target:addStatusEffect(tpz.effect.SLOW, 3500, 0, duration)
    end

    if (damage > 0 and resist > 0.3) then
        target:addStatusEffect(tpz.effect.SILENCE, 1, 0, duration)
    end

    return damage
end