-----------------------------------
-- Attachment: Amplifier II
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    onUpdate(pet, 0)
end

function onUnequip(pet)
    updateModPerformance(pet, tpz.mod.MAG_BURST_BONUS, 'amplifier_ii_burst', 0)
	updateModPerformance(pet, tpz.mod.FASTCAST, 'amplifier_ii_fastcast', 0)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, tpz.mod.MAG_BURST_BONUS, 'amplifier_ii_burst', 10)
		updateModPerformance(pet, tpz.mod.FASTCAST, 'amplifier_ii_fastcast', 20)
    elseif maneuvers == 1 then
        updateModPerformance(pet, tpz.mod.MAG_BURST_BONUS, 'amplifier_ii_burst', 20)
		updateModPerformance(pet, tpz.mod.FASTCAST, 'amplifier_ii_fastcast', 30)
    elseif maneuvers == 2 then
        updateModPerformance(pet, tpz.mod.MAG_BURST_BONUS, 'amplifier_ii_burst', 35)
		updateModPerformance(pet, tpz.mod.FASTCAST, 'amplifier_ii_fastcast', 40)
    elseif maneuvers == 3 then
        updateModPerformance(pet, tpz.mod.MAG_BURST_BONUS, 'amplifier_ii_burst', 50)
		updateModPerformance(pet, tpz.mod.FASTCAST, 'amplifier_ii_fastcast', 50)
    end
end