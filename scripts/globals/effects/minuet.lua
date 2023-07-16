-----------------------------------
--
-- tpz.effect.MINUET
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onEffectGain(target, effect)
	local power, empSetBonus, bonusMod = songsCheckEmpEffect(target, effect)
	
    target:addMod(tpz.mod.ATT, power)
    target:addMod(tpz.mod.RATT, power)
	target:addMod(bonusMod, empSetBonus)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	local power, empSetBonus, bonusMod = songsCheckEmpEffect(target, effect)
	
    target:delMod(tpz.mod.ATT, power)
    target:delMod(tpz.mod.RATT, power)
	target:delMod(bonusMod, empSetBonus)
end
