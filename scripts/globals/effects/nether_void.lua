-----------------------------------
--
-- tpz.effect.NETHER_VOID
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(tpz.mod.NETHER_VOID_BONUS, effect:getPower())
end

function onEffectTick(target,effect)
	
end

function onEffectLose(target,effect)
	target:delMod(tpz.mod.NETHER_VOID_BONUS, effect:getPower())
end