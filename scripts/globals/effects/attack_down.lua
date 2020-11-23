-----------------------------------
--
-- tpz.effect.ATTACK_DOWN
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
	power = effect:getPower()
--	printf("Attack Down onEffectGain POWER: [%f]\n", power)
    target:addMod(tpz.mod.ATTP,-power)
	target:addMod(tpz.mod.RATTP,-power)
end

function onEffectTick(target,effect)
	
end

function onEffectLose(target,effect)
    power = effect:getPower()
	target:delMod(tpz.mod.ATTP,-power)
	target:delMod(tpz.mod.RATTP,-power)
end