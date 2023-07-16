-----------------------------------
--
-- tpz.effect.DIRGE
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onEffectGain(target, effect)
	local power, empSetBonus, bonusMod = songsCheckEmpEffect(target, effect)
	
	target:addMod(tpz.mod.ENMITY, -power)
	target:addMod(bonusMod, empSetBonus)
end

function onEffectTick(target,effect)
end

function onEffectLose(target, effect)
	local power, empSetBonus, bonusMod = songsCheckEmpEffect(target, effect)
	
	target:delMod(tpz.mod.ENMITY, -effect:getPower())
	target:delMod(bonusMod, empSetBonus)
end
