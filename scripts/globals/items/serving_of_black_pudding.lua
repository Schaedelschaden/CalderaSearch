-----------------------------------------
-- ID: 5552
-- Item: Serving of Black Pudding
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +8
-- MP +5% Cap 25
-- Intelligence +4
-- HP Recovered while healing +1
-- MP Recovered while healing +1
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0

    if target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD) then
        result = tpz.msg.basic.IS_FULL
    end

    return result
end

function onItemUse(target)
    local month    = tonumber(os.date("%m"))
    local duration = 10800

    if month == 1 or month == 2 or month == 12 then
        duration = 14400
    end

    target:addStatusEffect(tpz.effect.FOOD, 0, 0, duration, 5552)
    target:getStatusEffect(tpz.effect.FOOD):unsetFlag(tpz.effectFlag.DEATH)
end

function onEffectGain(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 1 or month == 2 or month == 12 then
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
    else
        target:addMod(tpz.mod.FOOD_MPP, 5)
        target:addMod(tpz.mod.FOOD_MP_CAP, 25)
        target:addMod(tpz.mod.HP, 8)
        target:addMod(tpz.mod.INT, 4)
        target:addMod(tpz.mod.HPHEAL, 1)
        target:addMod(tpz.mod.MPHEAL, 1)
    end
end

function onEffectLose(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 1 or month == 2 or month == 12 then
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
    else
        target:delMod(tpz.mod.FOOD_MPP, 5)
        target:delMod(tpz.mod.FOOD_MP_CAP, 25)
        target:delMod(tpz.mod.HP, 8)
        target:delMod(tpz.mod.INT, 4)
        target:delMod(tpz.mod.HPHEAL, 1)
        target:delMod(tpz.mod.MPHEAL, 1)
    end
end
