-----------------------------------
--
-- tpz.effect.FANTASIA
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onEffectGain(target, effect)
	local power, empSetBonus, bonusMod = songsCheckEmpEffect(target, effect)
	
	target:addMod(tpz.mod.BLINDRES, power)
	target:addMod(bonusMod, empSetBonus)
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	local power, empSetBonus, bonusMod = songsCheckEmpEffect(target, effect)
	
    target:delMod(tpz.mod.BLINDRES, power)
	target:delMod(bonusMod, empSetBonus)
end
