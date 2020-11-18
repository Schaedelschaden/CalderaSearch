-----------------------------------
--
--     tpz.effect.CURING_CONDUIT
--
-----------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/common")

function onEffectGain(target,effect)
	target:addMod(tpz.mod.CURE_POTENCY_RCVD, 15)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
	target:delMod(tpz.mod.CURE_POTENCY_RCVD, 15)
end