-----------------------------------
--
-- tpz.effect.MARCH
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onEffectGain(target, effect)
	local power, empSetBonus, bonusMod = songsCheckEmpEffect(target, effect)

    target:addMod(tpz.mod.HASTE_MAGIC, effect:getPower())
	target:addMod(bonusMod, empSetBonus)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	local power, empSetBonus, bonusMod = songsCheckEmpEffect(target, effect)
	
    target:delMod(tpz.mod.HASTE_MAGIC, effect:getPower())
	target:delMod(bonusMod, empSetBonus)
end
