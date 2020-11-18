-----------------------------------
-- Attachment: Barrier Module
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    onUpdate(pet, 0)
end

function onUnequip(pet)
    updateModPerformance(pet, tpz.mod.SHIELDBLOCKRATE, 'barrier_module_shield', 0)
	updateModPerformance(pet, tpz.mod.AUTO_SHIELD_BASH_DELAY, 'barrier_module_bash', 0)
	updateModPerformance(pet, tpz.mod.SHIELD_MASTERY_TP, 'barrier_module_mastery', 0)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, tpz.mod.SHIELDBLOCKRATE, 'barrier_module_shield', 7)
    elseif maneuvers == 1 then
        updateModPerformance(pet, tpz.mod.SHIELDBLOCKRATE, 'barrier_module_shield', 14)
		updateModPerformance(pet, tpz.mod.AUTO_SHIELD_BASH_DELAY, 'barrier_module_bash', 20)
		updateModPerformance(pet, tpz.mod.SHIELD_MASTERY_TP, 'barrier_module_mastery', 10)
    elseif maneuvers == 2 then
        updateModPerformance(pet, tpz.mod.SHIELDBLOCKRATE, 'barrier_module_shield', 21)
		updateModPerformance(pet, tpz.mod.AUTO_SHIELD_BASH_DELAY, 'barrier_module_bash', 35)
		updateModPerformance(pet, tpz.mod.SHIELD_MASTERY_TP, 'barrier_module_mastery', 20)
    elseif maneuvers == 3 then
        updateModPerformance(pet, tpz.mod.SHIELDBLOCKRATE, 'barrier_module_shield', 28)
		updateModPerformance(pet, tpz.mod.AUTO_SHIELD_BASH_DELAY, 'barrier_module_bash', 50)
		updateModPerformance(pet, tpz.mod.SHIELD_MASTERY_TP, 'barrier_module_mastery', 30)
    end
end