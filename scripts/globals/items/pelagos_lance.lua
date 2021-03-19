-----------------------------------------
-- ID: 20944
-- Item: Pelagos Lance
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onItemCheck(target, itemCheck)
	local equipID = target:getEquipID(tpz.slot.MAIN)
	
	if (itemCheck == 1 and equipID == 20944) then --Equip
		target:addMod(tpz.mod.RAIDEN_THRUST_DMG, 450)
	end
	
	if (itemCheck == 2 and equipID == 20944) then -- Unequip
		target:delMod(tpz.mod.RAIDEN_THRUST_DMG, 450)
	end
end