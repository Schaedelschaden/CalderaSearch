-----------------------------------------
-- ID: 15761
-- Item: Chariot Band
-- Experience Point Bonus
-----------------------------------------
-- Bonus: +75%
-- Duration: 720 min (12 hours)
-- Max bonus: 10,000 exp
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
	target:addStatusEffect(tpz.effect.DEDICATION,75,0,43200,0,10000)
end