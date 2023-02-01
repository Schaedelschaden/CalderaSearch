-----------------------------------------
-- ID: 5621
-- Item: Candy Ring
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- Dexterity 4
-- Agility 4
-- Charisma 4
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
    local duration = 14400

    target:addStatusEffect(tpz.effect.FOOD, 0, 0, duration, 5621)
    target:getStatusEffect(tpz.effect.FOOD):unsetFlag(tpz.effectFlag.DEATH)
end

function onEffectGain(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 1 or month == 2 or month == 12 then
        target:addMod(tpz.mod.STR, 30)
        target:addMod(tpz.mod.VIT, 30)
        target:addMod(tpz.mod.DEX, 30)
        target:addMod(tpz.mod.AGI, 30)
        target:addMod(tpz.mod.INT, -20)
        target:addMod(tpz.mod.MND, -20)
        target:addMod(tpz.mod.CHR, -20)
    else
        target:addMod(tpz.mod.DEX, 4)
        target:addMod(tpz.mod.AGI, 4)
        target:addMod(tpz.mod.CHR, 4)
    end
end

function onEffectLose(target, effect)
    local month = tonumber(os.date("%m"))

    -- Caldera seasonal food custom adjustments
    if month == 1 or month == 2 or month == 12 then
        target:delMod(tpz.mod.STR, 30)
        target:delMod(tpz.mod.VIT, 30)
        target:delMod(tpz.mod.DEX, 30)
        target:delMod(tpz.mod.AGI, 30)
        target:delMod(tpz.mod.INT, -20)
        target:delMod(tpz.mod.MND, -20)
        target:delMod(tpz.mod.CHR, -20)
    else
        target:delMod(tpz.mod.DEX, 4)
        target:delMod(tpz.mod.AGI, 4)
        target:delMod(tpz.mod.CHR, 4)
    end
end
