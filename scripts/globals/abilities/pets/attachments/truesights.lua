-----------------------------------
-- Attachment: Truesights
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    onUpdate(pet, 0)
end

function onUnequip(pet)
    updateModPerformance(pet, tpz.mod.RANGED_DMG_RATING, 'truesights_dmg', 0)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    
	if maneuvers == 0 then
        updateModPerformance(pet, tpz.mod.RANGED_DMG_RATING, 'truesights_dmg', 30)
    elseif maneuvers == 1 then
        updateModPerformance(pet, tpz.mod.RANGED_DMG_RATING, 'truesights_dmg', 60)
    elseif maneuvers == 2 then
        updateModPerformance(pet, tpz.mod.RANGED_DMG_RATING, 'truesights_dmg', 90)
    elseif maneuvers == 3 then
        updateModPerformance(pet, tpz.mod.RANGED_DMG_RATING, 'truesights_dmg', 120)
    end
end