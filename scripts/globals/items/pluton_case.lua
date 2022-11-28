-----------------------------------------
-- ID: 6180
-- Item: Pluton Case
-- When used, you will obtain between 3 and 6 Plutons
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
	-- local ID = zones[target:getZoneID()]
	
    target:addItem(4059, math.random(3, 6))
	-- target:messageSpecial(ID.text.ITEM_OBTAINED, 8798)
end