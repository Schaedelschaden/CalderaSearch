-----------------------------------------
-- ID: 23714
-- Item: Volte Doublet
-- Item Effect: Recover 50% of max MP
-----------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
	local maxMP = target:getMaxMP()
	local currentMP = target:getMP()
	local restoreMP = maxMP * 0.5
	
	if (currentMP + restoreMP >= maxMP) then
		restoreMP = maxMP
	else
		restoreMP = currentMP + restoreMP
	end

    target:setMP(restoreMP)
end