-----------------------------------------
-- ID: 27556
-- Item: Echad Ring
-- Experience Point Bonus
-----------------------------------------
-- Bonus: +150%
-- Duration: 720 min (12 hours)
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
	target:addStatusEffect(tpz.effect.DEDICATION,150,0,43200,0,30000)
end