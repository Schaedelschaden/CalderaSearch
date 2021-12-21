-----------------------------------
--
-- tpz.effect.BIND
--
-----------------------------------

function onEffectGain(target,effect)
	if (target:hasStatusEffect(tpz.effect.WEIGHT)) then
		target:delStatusEffect(tpz.effect.WEIGHT)
	end

    effect:setPower(target:speed())
    target:speed(0)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:speed(effect:getPower())
	
	if (effect:getSubPower() <= 0 and not target:hasStatusEffect(tpz.effect.BIND) or not target:hasStatusEffect(tpz.effect.WEIGHT)) then
		if (target:isMob()) then
			target:speed(60)
		else
			target:speed(80)
		end
	end
end