-----------------------------------
-- Effect: Geo-Magic Def Boost
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	local power = target:getMod(tpz.mod.MDEF) * (effect:getPower() / 100)

    target:addMod(tpz.mod.MDEF, power)
	target:setLocalVar("GEO_MDEF_Boost", power)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	local power = target:getLocalVar("GEO_MDEF_Boost")
    target:delMod(tpz.mod.MDEF, power)
end