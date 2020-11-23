-----------------------------------
--
--     tpz.effect.CROOKED_CARDS
--
-----------------------------------
require("scripts/globals/status")

function onEffectGain(target, effect)
    target:setMod(tpz.mod.PHANTOM_ROLL_EFFECT, effect:getPower())
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.PHANTOM_ROLL_EFFECT, effect:getPower())
end