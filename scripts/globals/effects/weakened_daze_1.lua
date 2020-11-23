-----------------------------------
--
-- tpz.effect.WEAKENED_DAZE
--
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.MEVA, -10)
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MEVA, -10)
end