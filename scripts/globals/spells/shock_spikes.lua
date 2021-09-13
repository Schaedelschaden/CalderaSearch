-----------------------------------------
-- Spell: Shock Spikes
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = calculateDuration(SPIKE_EFFECT_DURATION, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    local typeEffect = tpz.effect.SHOCK_SPIKES
    local int = caster:getStat(tpz.mod.INT)
    local magicAtk = caster:getMod(tpz.mod.MATT)
    local power = ((int + 10) / 20 + 2) * (1 + magicAtk / 100)
	
	if (caster:hasStatusEffect(tpz.effect.EMBOLDEN)) then
		power = power * 2
		duration = duration / 2
		caster:delStatusEffect(tpz.effect.EMBOLDEN)
	end

    if target:addStatusEffect(typeEffect, power, 0, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return typeEffect
end