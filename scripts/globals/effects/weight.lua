-----------------------------------
--
--     tpz.effect.WEIGHT
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
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
end