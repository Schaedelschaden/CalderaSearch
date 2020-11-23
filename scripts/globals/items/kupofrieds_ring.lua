-----------------------------------------
-- ID: 15793
-- Item: Kupofried's Ring
-- Experience Point Bonus
-----------------------------------------
-- Bonus: +100%
-- Duration: 1,440 min (24 hours)
-- Max bonus: 30,000 EXP
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(tpz.effect.DEDICATION) == true) then
        result = 56
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.DEDICATION,100,0,86400,0,30000)
end