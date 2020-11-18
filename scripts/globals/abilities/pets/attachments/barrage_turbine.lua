-----------------------------------
-- Attachment: Barrage Turbine
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    onUpdate(pet, 0)
end

function onUnequip(pet)
	updateModPerformance(pet, tpz.mod.BARRAGE_TURBINE_SHOTS, 'barrage_turbine_shots', 0)
end

function onManeuverGain(pet, maneuvers)
	onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
	onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, tpz.mod.BARRAGE_TURBINE_SHOTS, 'barrage_turbine_shots', 0)
    elseif maneuvers == 1 then
        updateModPerformance(pet, tpz.mod.BARRAGE_TURBINE_SHOTS, 'barrage_turbine_shots', 2)
    elseif maneuvers == 2 then
        updateModPerformance(pet, tpz.mod.BARRAGE_TURBINE_SHOTS, 'barrage_turbine_shots', 3)
    elseif maneuvers == 3 then
        updateModPerformance(pet, tpz.mod.BARRAGE_TURBINE_SHOTS, 'barrage_turbine_shots', 4)
    end
end