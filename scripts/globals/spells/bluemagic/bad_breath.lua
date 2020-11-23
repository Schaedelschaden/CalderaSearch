-----------------------------------------
-- Spell: Bad Breath
-- Deals earth damage that inflicts multiple status ailments on enemies within a fan-shaped area originating from the caster.
-- Spell cost: 212 MP
-- Monster Type: Plantoids
-- Spell Type: Breath (Earth)
-- Blue Magic Points: 5
-- Stat Bonus: INT+2, MND+2
-- Level: 61
-- Casting Time: 8.75 seconds
-- Recast Time: 120 seconds
-- Magic Bursts on: Scission, Gravitation, Darkness
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
	local duration = 60
	local params = {}
		params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
		params.attackType = tpz.attackType.BREATH
		params.damageType = tpz.damageType.EARTH
		params.spellFamily = tpz.ecosystem.PLANTOID
		params.hpMod = 12 -- 50%
		params.lvlMod = 3.0 -- fLV
		params.bonus = 1.00 -- +% Base Damage Bonus
		params.multiplier = 1.50 -- Azure Lore Damage multiplier
	local damage = BlueBreathSpell(caster, target, spell, params)
	damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    local resist = applyResistance(caster, target, spell, params)
	duration = duration * resist

    if (damage > 0 and resist > 0.16) then
        target:addStatusEffect(tpz.effect.PARALYSIS, 15, 0, duration)
    end

    if (damage > 0 and resist > 0.16) then
        target:addStatusEffect(tpz.effect.WEIGHT, 14, 0, duration)
    end

    if (damage > 0 and resist > 0.16) then
        target:addStatusEffect(tpz.effect.POISON, 4, 0, duration)
    end

    if (damage > 0 and resist > 0.16) then
        target:addStatusEffect(tpz.effect.SLOW, 2000, 0, duration)
    end

    if (damage > 0 and resist > 0.16) then
        target:addStatusEffect(tpz.effect.SILENCE, 1, 0, duration)
    end

    if (damage > 0 and resist > 0.16) then
        target:addStatusEffect(tpz.effect.BIND, 1, 0, duration)
    end
    
	if (damage > 0 and resist > 0.16) then
        target:addStatusEffect(tpz.effect.BLINDNESS, 50, 0, duration)
    end

    return damage

end