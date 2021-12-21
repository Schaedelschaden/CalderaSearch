-----------------------------------------
-- ID: 6559
-- Item: Worn Sack of Snoworb Stones +1
-- When used, you will obtain 6-12 Snoworb Stone +1's
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
    target:addItem(8958, math.random(6, 12))
end