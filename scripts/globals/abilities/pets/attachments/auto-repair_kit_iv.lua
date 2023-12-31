-----------------------------------
-- Attachment: Auto-repair Kit IV
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    -- We do not have support to do a fraction of a percent so we rounded
    local frame = pet:getAutomatonFrame()
    if frame == tpz.frames.HARLEQUIN then
        pet:addMod(tpz.mod.HPP, 20)
    elseif frame == tpz.frames.VALOREDGE then
        pet:addMod(tpz.mod.HPP, 17)
    elseif frame == tpz.frames.SHARPSHOT then
        pet:addMod(tpz.mod.HPP, 22)
    elseif frame == tpz.frames.STORMWAKER then
        pet:addMod(tpz.mod.HPP, 25)
    end
end

function onUnequip(pet)
    local frame = pet:getAutomatonFrame()
    if frame == tpz.frames.HARLEQUIN then
        pet:delMod(tpz.mod.HPP, 20)
    elseif frame == tpz.frames.VALOREDGE then
        pet:delMod(tpz.mod.HPP, 17)
    elseif frame == tpz.frames.SHARPSHOT then
        pet:delMod(tpz.mod.HPP, 22)
    elseif frame == tpz.frames.STORMWAKER then
        pet:delMod(tpz.mod.HPP, 25)
    end
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    local power = 0
    if maneuvers > 0 then
        power = math.floor(12 + 3 * maneuvers + (pet:getMaxHP() * (2.4 + 0.6 * maneuvers) / 100))
    end
    updateModPerformance(pet, tpz.mod.REGEN, 'autorepair_kit_iv_mod', power)
end