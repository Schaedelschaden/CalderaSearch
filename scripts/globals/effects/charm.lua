-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
	
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:setTP(0)
    target:uncharm()
	
	-- Charms with a power of 2 apply a costume to the target using
	-- a listener to wait for the mobskill animation to complete
	if (effect:getPower() == 2 and target:isPC()) then
		target:costume(0)
	end
end