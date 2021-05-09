-----------------------------------
--
-- tpz.effect.DAKEN
--
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(tpz.mod.DAKEN, 100)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
	target:delMod(tpz.mod.DAKEN, 100)
end