-----------------------------------
--
--     tpz.effect.WEIGHT
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	if (target:hasStatusEffect(tpz.effect.BIND)) then
		target:delStatusEffect(tpz.effect.BIND)
	end

	local baseSpeed = target:speed()
	effect:setSubPower(baseSpeed)

    target:addMod(tpz.mod.MOVE, -effect:getPower())
	target:speed(baseSpeed - (baseSpeed * (effect:getPower() / 100)))
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MOVE, -effect:getPower())
	target:speed(effect:getSubPower())
	
	if (effect:getSubPower() <= 0 and not target:hasStatusEffect(tpz.effect.BIND) or not target:hasStatusEffect(tpz.effect.WEIGHT)) then
		if (target:isMob()) then
			target:speed(60)
		else
			target:speed(80)
		end
	end
end