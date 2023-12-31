-----------------------------------------
-- ID: 6282
-- Item: Ra'Kaznar Bullet Pouch
-- When used, you will obtain one stack of Ra'Kaznar Bullets
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
    target:addItem(21332, 99)
end