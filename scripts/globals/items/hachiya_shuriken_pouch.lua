-----------------------------------------
-- ID: 6308
-- Item: Hac. Sh. Pouch
-- When used, you will obtain one stack of Hachiya Shurikens
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
    target:addItem(21355, 99)
end