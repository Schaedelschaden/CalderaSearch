-----------------------------------------
-- ID: 22040
-- Equip: Daybreak
-- Able to cast "Dispelga"
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, itemCheck)
	local mainHand = target:getEquipID(tpz.slot.MAIN)
	
	if (mainHand == 22040) then
		if (itemCheck == 1) then --Equip
			target:addSpell(360)
		end
	
		if (itemCheck == 2) then -- Unequip
			target:delSpell(360)
		end
	end
end