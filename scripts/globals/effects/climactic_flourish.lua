-----------------------------------
--
-- tpz.effect.CLIMACTIC_FLOURISH
--
-----------------------------------

function onEffectGain(target, effect)
	
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	target:setCharVar("ClimacticFlourishCrits", 0)
end