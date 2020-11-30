-----------------------------------------
-- ID: 11363
-- Equip: Twilight Cloak
-- Able to cast "Impact"
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, itemCheck)
	if (itemCheck == 1) then --Equip
		target:addSpell(503)
	end
	
	if (itemCheck == 2) then -- Unequip
		target:delSpell(503)
	end
end