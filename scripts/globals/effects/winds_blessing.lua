-----------------------------------
--
-- tpz.effect.WINDS_BLESSING
--
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.ONE_FOR_ALL_EFFECT, effect:getPower())
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ONE_FOR_ALL_EFFECT, effect:getPower())
end