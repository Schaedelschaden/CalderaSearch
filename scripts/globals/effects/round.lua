-----------------------------------
--
-- tpz.effect.ROUND
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onEffectGain(target, effect)
	local power, empSetBonus, bonusMod = songsCheckEmpEffect(target, effect)
	
	target:addMod(tpz.mod.CURSERES, power)
	target:addMod(bonusMod, empSetBonus)
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	local power, empSetBonus, bonusMod = songsCheckEmpEffect(target, effect)
	
    target:delMod(tpz.mod.CURSERES, power)
	target:delMod(bonusMod, empSetBonus)
end
