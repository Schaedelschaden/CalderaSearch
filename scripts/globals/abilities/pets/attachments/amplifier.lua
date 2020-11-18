-----------------------------------
-- Attachment: Amplifier
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    onUpdate(pet, 0)
end

function onUnequip(pet)
    updateModPerformance(pet, tpz.mod.MAG_BURST_BONUS, 'amplifier_burst', 0)
	updateModPerformance(pet, tpz.mod.FASTCAST, 'amplifier_fastcast', 0)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, tpz.mod.MAG_BURST_BONUS, 'amplifier_burst', 10)
		updateModPerformance(pet, tpz.mod.FASTCAST, 'amplifier_fastcast', 10)
    elseif maneuvers == 1 then
        updateModPerformance(pet, tpz.mod.MAG_BURST_BONUS, 'amplifier_burst', 20)
		updateModPerformance(pet, tpz.mod.FASTCAST, 'amplifier_fastcast', 15)
    elseif maneuvers == 2 then
        updateModPerformance(pet, tpz.mod.MAG_BURST_BONUS, 'amplifier_burst', 35)
		updateModPerformance(pet, tpz.mod.FASTCAST, 'amplifier_fastcast', 20)
    elseif maneuvers == 3 then
        updateModPerformance(pet, tpz.mod.MAG_BURST_BONUS, 'amplifier_burst', 50)
		updateModPerformance(pet, tpz.mod.FASTCAST, 'amplifier_fastcast', 25)
    end
end