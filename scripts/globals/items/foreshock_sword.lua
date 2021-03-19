-----------------------------------------
-- ID: 20716
-- Item: Foreshock Sword
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onItemCheck(target, itemCheck)
	local equipID = target:getEquipID(tpz.slot.MAIN)
	
	if (itemCheck == 1 and equipID == 20757) then --Equip
		target:addMod(tpz.mod.HERCULEAN_SLASH_DMG, 400)
	end
	
	if (itemCheck == 2 and equipID == 20757) then -- Unequip
		target:delMod(tpz.mod.HERCULEAN_SLASH_DMG, 400)
	end
end