-----------------------------------
--
--	tpz.effect.RUN_WILD
--
-----------------------------------

function onEffectGain(target,effect)
	
end

function onEffectTick(target,effect)
	
end

function onEffectLose(target,effect)
	local master = target:getMaster()
	master:despawnPet()
end