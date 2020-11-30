-----------------------------------
-- Effect: Geo-Magic Def Boost
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	power = target:getMod(tpz.mod.MDEF) * (effect:getPower() / 100)
    target:addMod(tpz.mod.MDEF, power)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MDEF, power)
end