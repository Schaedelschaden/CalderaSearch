-----------------------------------
--
-- tpz.effect.BLITZERS_ROLL
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(tpz.mod.DELAYP, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(tpz.mod.DELAYP, effect:getPower())
end