-----------------------------------
--
-- tpz.effect.ENCUMBRANCE
--
-----------------------------------
-- Locks the specified gear slot and disables switching equipment
-- Use the values below when setting the effect's power to determine the slot
-- Values can be added together to disable multiple slots
-- Ex. 1 + 4 = 5 would disable the Main and Ranged slots
-- Main   = 1     (0x0001)
-- Sub    = 2     (0x0002)
-- Ranged = 4     (0x0004)
-- Ammo   = 8     (0x0008)
-- Head   = 16    (0x0010)
-- Body   = 32    (0x0020)
-- Hands  = 64    (0x0040)
-- Legs   = 128   (0x0080)
-- Feet   = 256   (0x0100)
-- Neck   = 512   (0x0200)
-- Waist  = 1024  (0x0400)
-- Ear1   = 2048  (0x0800)
-- Ear 2  = 4096  (0x1000)
-- Ring1  = 8192  (0x2000)
-- Ring2  = 16384 (0x4000)
-- Back   = 32768 (0x8000)
-- All    = 65535 (0xFFFF)
-----------------------------------

function onEffectGain(target, effect)
    target:setEquipBlock(effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:setEquipBlock(0)
end
