-----------------------------------------
-- Spell: Dread Spikes
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = calculateDuration(SPIKE_EFFECT_DURATION, caster, target, spell)
    local typeEffect = tpz.effect.DREAD_SPIKES
    local drainAmount = target:getMaxHP() / 2
	local EnhSpikes = 1 + (utils.clamp(caster:getMod(tpz.mod.ENH_DREAD_SPIKES), 1, 1000) / 1000)
	drainAmount = drainAmount * EnhSpikes

    if target:addStatusEffect(typeEffect, 0, 0, duration, 0, drainAmount, 1) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return typeEffect
end
