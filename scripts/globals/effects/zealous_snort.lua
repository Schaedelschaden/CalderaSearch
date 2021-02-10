-----------------------------------
--
-- tpz.effect.ZEALOUS_SNORT
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.HASTE_ABILITY, 2500)
    target:addMod(tpz.mod.MDEF, 25)
	target:addMod(tpz.mod.COUNTER, 25)
	target:addMod(tpz.mod.GUARD, 25)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.HASTE_ABILITY, 2500)
    target:delMod(tpz.mod.MDEF, 25)
	target:delMod(tpz.mod.COUNTER, 25)
	target:delMod(tpz.mod.GUARD, 25)
end