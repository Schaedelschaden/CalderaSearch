-----------------------------------
--
-- tpz.effect.GEO_HASTE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	local strength = effect:getPower()
	target:addMod(tpz.mod.HASTE_MAGIC, strength)
--	target:addMod(tpz.mod.STR, strength)
	printf("GEO-Haste onEffectGain STRENGTH: [%i]\n", strength)
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.HASTE_MAGIC, effect:getPower())
end