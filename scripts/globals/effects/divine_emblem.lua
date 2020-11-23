-----------------------------------
--
-- tpz.effect.DIVINE_EMBLEM
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(tpz.mod.DIVINE_ENMITY_BONUS,50) -- Percentage based (50%)
end

function onEffectTick(target,effect)

end

function onEffectLose(target,effect)
	target:delMod(tpz.mod.DIVINE_ENMITY_BONUS,50) -- Percentage based (50%)
end
