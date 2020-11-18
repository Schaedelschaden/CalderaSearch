-----------------------------------
-- Attachment: Barrier Module II
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    onUpdate(pet, 0)
end

function onUnequip(pet)
    updateModPerformance(pet, tpz.mod.SHIELDBLOCKRATE, 'barrier_module_ii_shield', 0)
	updateModPerformance(pet, tpz.mod.AUTO_SHIELD_BASH_DELAY, 'barrier_module_ii_bash', 0)
	updateModPerformance(pet, tpz.mod.SHIELD_MASTERY_TP, 'barrier_module_ii_mastery', 0)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, tpz.mod.SHIELDBLOCKRATE, 'barrier_module_ii_shield', 14)
    elseif maneuvers == 1 then
        updateModPerformance(pet, tpz.mod.SHIELDBLOCKRATE, 'barrier_module_ii_shield', 21)
		updateModPerformance(pet, tpz.mod.AUTO_SHIELD_BASH_DELAY, 'barrier_module_ii_bash', 30)
		updateModPerformance(pet, tpz.mod.SHIELD_MASTERY_TP, 'barrier_module_ii_mastery', 20)
    elseif maneuvers == 2 then
        updateModPerformance(pet, tpz.mod.SHIELDBLOCKRATE, 'barrier_module_ii_shield', 28)
		updateModPerformance(pet, tpz.mod.AUTO_SHIELD_BASH_DELAY, 'barrier_module_ii_bash', 45)
		updateModPerformance(pet, tpz.mod.SHIELD_MASTERY_TP, 'barrier_module_ii_mastery', 30)
    elseif maneuvers == 3 then
        updateModPerformance(pet, tpz.mod.SHIELDBLOCKRATE, 'barrier_module_ii_shield', 35)
		updateModPerformance(pet, tpz.mod.AUTO_SHIELD_BASH_DELAY, 'barrier_module_ii_bash', 70)
		updateModPerformance(pet, tpz.mod.SHIELD_MASTERY_TP, 'barrier_module_ii_mastery', 40)
    end
end