-----------------------------------
--
-- tpz.effect.DIVINE_EMBLEM
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.DIVINE_ENMITY_BONUS, effect:getPower())
	-- target:addMod(tpz.mod.MACC, effect:getPower() * 100)
end

function onEffectTick(target, effect)

end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.DIVINE_ENMITY_BONUS, effect:getPower())
	-- target:delMod(tpz.mod.MACC, effect:getPower() * 100)
end