-----------------------------------------
-- ID: 23715
-- Item: Volte Harness
-- Item Effect: TP+1000
-----------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
	local tp = target:getTP() + 1000
	
	if (tp > 3000) then
		tp = 3000
	end

    target:setTP(tp)
end