-----------------------------------------
-- ID: 6579
-- Behemoth Sandwich
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
        target:addMod(tpz.mod.STR, 30)
        target:addMod(tpz.mod.VIT, 30)
        target:addMod(tpz.mod.DEX, 30)
        target:addMod(tpz.mod.AGI, 30)
        target:addMod(tpz.mod.INT, -15)
        target:addMod(tpz.mod.MND, -15)
        target:addMod(tpz.mod.FOOD_ATTP, 30)
        target:addMod(tpz.mod.FOOD_DEFP, 30)
    else
        target:addMod(tpz.mod.STR, 4)
        target:addMod(tpz.mod.FOOD_ACCP, 10)
        target:addMod(tpz.mod.DEX, 4)
        target:addMod(tpz.mod.FOOD_ATTP, 20)
        target:addMod(tpz.mod.FOOD_DEFP, 20)
        target:addMod(tpz.mod.MDEF, 5)
    end
end

function onEffectLose(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 6 or month == 7 or month == 8 then
        target:delMod(tpz.mod.STR, 30)
        target:delMod(tpz.mod.VIT, 30)
        target:delMod(tpz.mod.DEX, 30)
        target:delMod(tpz.mod.AGI, 30)
        target:delMod(tpz.mod.INT, -15)
        target:delMod(tpz.mod.MND, -15)
        target:delMod(tpz.mod.FOOD_ATTP, 30)
        target:delMod(tpz.mod.FOOD_DEFP, 30)
    else
        target:delMod(tpz.mod.STR, 4)
        target:delMod(tpz.mod.FOOD_ACCP, 10)
        target:delMod(tpz.mod.DEX, 4)
        target:delMod(tpz.mod.FOOD_ATTP, 20)
        target:delMod(tpz.mod.FOOD_DEFP, 20)
        target:delMod(tpz.mod.MDEF, 5)
    end
end   