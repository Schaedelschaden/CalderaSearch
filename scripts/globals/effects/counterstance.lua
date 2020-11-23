-----------------------------------
-- tpz.effects.COUNTERSTANCE
-- DEF is removed in core as equip swaps can mess this up otherwise!
-- BLU Orcish Counterstance is also handled here
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    power = effect:getPower()
	if (power == 10) then
		target:addMod(tpz.mod.COUNTER, power)
		target:addMod(tpz.mod.COUNTER_DMG, 150)
	else
		target:addMod(tpz.mod.COUNTER, power)
	end
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    if (power == 10) then
		target:delMod(tpz.mod.COUNTER, power)
		target:delMod(tpz.mod.COUNTER_DMG, 150)
	else
		target:delMod(tpz.mod.COUNTER, power)
	end
end