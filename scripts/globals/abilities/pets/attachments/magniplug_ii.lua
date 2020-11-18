-----------------------------------
-- Attachment: Magniplug II
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    onUpdate(pet, 0)
end

function onUnequip(pet)
    updateModPerformance(pet, tpz.mod.MAIN_DMG_RATING, 'magniplug_ii_dmg', 0)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, tpz.mod.MAIN_DMG_RATING, 'magniplug_ii_dmg', 10)
    elseif maneuvers == 1 then
        updateModPerformance(pet, tpz.mod.MAIN_DMG_RATING, 'magniplug_ii_dmg', 20)
    elseif maneuvers == 2 then
        updateModPerformance(pet, tpz.mod.MAIN_DMG_RATING, 'magniplug_ii_dmg', 35)
    elseif maneuvers == 3 then
        updateModPerformance(pet, tpz.mod.MAIN_DMG_RATING, 'magniplug_ii_dmg', 50)
    end
end