-----------------------------------------
-- ID: 5296
-- Tarutaru Rice Cake
-- Enchantment: 60Min, Costume - Tarutaru child (female)
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    local month    = tonumber(os.date("%m"))
    local duration = 10800

    if month == 3 or month == 4 or month == 5 then

        if target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD) then
            result = tpz.msg.basic.IS_FULL
        end

        return result
    else
        if not target:canUseMisc(tpz.zoneMisc.COSTUME) then
            return tpz.msg.basic.CANT_BE_USED_IN_AREA
        end
        return 0
    end   
end

function onItemUse(target)
    local month    = tonumber(os.date("%m"))
    local duration = 10800

    if month == 3 or month == 4 or month == 5 then
        duration = 14400

        target:addStatusEffect(tpz.effect.FOOD, 0, 0, duration, 5550)
        target:getStatusEffect(tpz.effect.FOOD):unsetFlag(tpz.effectFlag.DEATH)
    else
        target:addStatusEffect(tpz.effect.COSTUME, 823, 0, 3600)
    end
end

function onEffectGain(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 3 or month == 4 or month == 5 then
        target:addMod(tpz.mod.INT, 15)
        target:addMod(tpz.mod.CHR, 15)
        target:addMod(tpz.mod.FIRE_AFFINITY_DMG, 2)    -- +5% damage per level
        target:addMod(tpz.mod.ICE_AFFINITY_DMG, 2)     -- ...
        target:addMod(tpz.mod.WIND_AFFINITY_DMG, 2)    -- ...
        target:addMod(tpz.mod.EARTH_AFFINITY_DMG, 2)   -- ...
        target:addMod(tpz.mod.THUNDER_AFFINITY_DMG, 2) -- ...
        target:addMod(tpz.mod.WATER_AFFINITY_DMG, 2)   -- ...
        target:addMod(tpz.mod.LIGHT_AFFINITY_DMG, 2)   -- ...
        target:addMod(tpz.mod.DARK_AFFINITY_DMG, 2)    -- +5% damage per level
        target:addMod(tpz.mod.FIRE_AFFINITY_ACC, 5)    -- +10 MACC per level
        target:addMod(tpz.mod.ICE_AFFINITY_ACC, 5)     -- ...
        target:addMod(tpz.mod.WIND_AFFINITY_ACC, 5)    -- ...
        target:addMod(tpz.mod.EARTH_AFFINITY_ACC, 5)   -- ...
        target:addMod(tpz.mod.THUNDER_AFFINITY_ACC, 5) -- ...
        target:addMod(tpz.mod.WATER_AFFINITY_ACC, 5)   -- ...
        target:addMod(tpz.mod.LIGHT_AFFINITY_ACC, 5)   -- ...
        target:addMod(tpz.mod.DARK_AFFINITY_ACC, 5)    -- +10 MACC per level
    end
end

function onEffectLose(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 3 or month == 4 or month == 5 then
        target:delMod(tpz.mod.INT, 15)
        target:delMod(tpz.mod.CHR, 15)
        target:delMod(tpz.mod.FIRE_AFFINITY_DMG, 2)    -- +5% damage per level
        target:delMod(tpz.mod.ICE_AFFINITY_DMG, 2)     -- ...
        target:delMod(tpz.mod.WIND_AFFINITY_DMG, 2)    -- ...
        target:delMod(tpz.mod.EARTH_AFFINITY_DMG, 2)   -- ...
        target:delMod(tpz.mod.THUNDER_AFFINITY_DMG, 2) -- ...
        target:delMod(tpz.mod.WATER_AFFINITY_DMG, 2)   -- ...
        target:delMod(tpz.mod.LIGHT_AFFINITY_DMG, 2)   -- ...
        target:delMod(tpz.mod.DARK_AFFINITY_DMG, 2)    -- +5% damage per level
        target:delMod(tpz.mod.FIRE_AFFINITY_ACC, 5)    -- +10 MACC per level
        target:delMod(tpz.mod.ICE_AFFINITY_ACC, 5)     -- ...
        target:delMod(tpz.mod.WIND_AFFINITY_ACC, 5)    -- ...
        target:delMod(tpz.mod.EARTH_AFFINITY_ACC, 5)   -- ...
        target:delMod(tpz.mod.THUNDER_AFFINITY_ACC, 5) -- ...
        target:delMod(tpz.mod.WATER_AFFINITY_ACC, 5)   -- ...
        target:delMod(tpz.mod.LIGHT_AFFINITY_ACC, 5)   -- ...
        target:delMod(tpz.mod.DARK_AFFINITY_ACC, 5)    -- +10 MACC per level
    end
end
