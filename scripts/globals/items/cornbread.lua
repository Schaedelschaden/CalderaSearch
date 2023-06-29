-----------------------------------------
-- ID: 6581
-- Cornbread
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    local month    = tonumber(os.date("%m"))
    local duration = 10800

    if month == 6 or month == 7 or month == 8 then
        if target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD) then
            result = tpz.msg.basic.IS_FULL
        end
    end
end

function onItemUse(target)
    local month    = tonumber(os.date("%m"))
    local duration = 10800

    if month == 6 or month == 7 or month == 8 then
        duration = 14400

        target:addStatusEffect(tpz.effect.FOOD, 0, 0, duration, 5550)
        target:getStatusEffect(tpz.effect.FOOD):unsetFlag(tpz.effectFlag.DEATH)
    end
    
function onEffectGain(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 6 or month == 7 or month == 8 then
        target:addMod(tpz.mod.INT, 30)
        target:addMod(tpz.mod.MND, 30)
        target:addMod(tpz.mod.MATT, 30)
        target:addMod(tpz.mod.STR, -15)
        target:addMod(tpz.mod.DEX, -15)
        target:addMod(tpz.mod.FOOD_MPP, 30)
        target:addMod(tpz.mod.FOOD_MACCP, 30)
    else
        target:addMod(tpz.mod.MAG_BURST_BONUS_II, 2)
        target:addMod(tpz.mod.FAST_CAST, 5)
    end
end

function onEffectLose(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 6 or month == 7 or month == 8 then
        target:delMod(tpz.mod.INT, 30)
        target:delMod(tpz.mod.MND, 30)
        target:delMod(tpz.mod.MATT, 30)
        target:delMod(tpz.mod.STR, -15)
        target:delMod(tpz.mod.DEX, -15)
        target:delMod(tpz.mod.FOOD_MPP, 30)
        target:delMod(tpz.mod.FOOD_MACCP, 30)
    else
        target:delMod(tpz.mod.MAG_BURST_BONUS_II, 2)
        target:delMod(tpz.mod.FAST_CAST, 5)
    end
end   