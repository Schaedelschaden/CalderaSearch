-----------------------------------
--
-- tpz.effect.TRIPLE_SHOT
--
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(tpz.mod.TRIPLE_SHOT_RATE, effect:getPower())
end

function onEffectTick(target,effect)
	
end

function onEffectLose(target,effect)
	target:delMod(tpz.mod.TRIPLE_SHOT_RATE, effect:getPower())
end