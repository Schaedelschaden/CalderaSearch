-----------------------------------------
-- ID: 6555
-- Item: Worn Sack of Leafdim Stones +1
-- When used, you will obtain 6-12 Leafdim Stone +1's
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
    target:addItem(8952, math.random(6, 12))
end