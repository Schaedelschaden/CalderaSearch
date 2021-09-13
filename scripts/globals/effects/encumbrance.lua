-----------------------------------
--
-- tpz.effect.ENCUMBRANCE
--
-----------------------------------
-- Locks the specified gear slot and disables switching equipment
-- Use the values below when setting the effect's power to determine the slot
-- Values can be added together to disable multiple slots
-- Ex. 1 + 4 = 5 would disable the Main and Ranged slots
-- Main   = 1
-- Sub    = 2
-- Ranged = 4
-- Ammo   = 8
-- Head   = 16
-- Body   = 32
-- Hands  = 64
-- Legs   = 128
-- Feet   = 256
-- Neck   = 512
-- Waist  = 1024
-- Ear1   = 2048
-- Ear 2  = 4096
-- Ring1  = 8192
-- Ring2  = 16384
-- Back   = 32768
-- All    = 65535
-----------------------------------

function onEffectGain(target,effect)
    target:setEquipBlock(effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:setEquipBlock(0)
end
