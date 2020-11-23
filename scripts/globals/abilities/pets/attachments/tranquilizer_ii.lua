-----------------------------------
-- Attachment: Tranquilizer II
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    onUpdate(pet, 0)
end

function onUnequip(pet)
    updateModPerformance(pet, tpz.mod.MACC, 'tranquilizer_ii_macc', 0)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, tpz.mod.MACC, 'tranquilizer_ii_macc', 20)
    elseif maneuvers == 1 then
        updateModPerformance(pet, tpz.mod.MACC, 'tranquilizer_ii_macc', 40)
    elseif maneuvers == 2 then
        updateModPerformance(pet, tpz.mod.MACC, 'tranquilizer_ii_macc', 50)
    elseif maneuvers == 3 then
        updateModPerformance(pet, tpz.mod.MACC, 'tranquilizer_ii_macc', 65)
    end
end