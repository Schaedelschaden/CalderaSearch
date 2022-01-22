-----------------------------------------
-- ID: 6267
-- Item: Aged Box (Bayld)
-- When used, you will obtain between 3 and 15 HP Bayld
-----------------------------------------
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:getFreeSlotsCount() == 0 then
        result = tpz.msg.basic.ITEM_NO_USE_INVENTORY
    end
    return result
end

function onItemUse(target)
    target:addItem(8798, math.random(3, 15))
end