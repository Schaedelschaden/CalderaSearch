-----------------------------------------
-- ID: 20529
-- Item: Calved Claws
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onItemCheck(target, itemCheck)
	local equipID = target:getEquipID(tpz.slot.MAIN)
	
	if (itemCheck == 1 and equipID == 20529) then --Equip
		target:addMod(tpz.mod.ASURAN_FISTS_DMG, 350)
	end
	
	if (itemCheck == 2 and equipID == 20529) then -- Unequip
		target:delMod(tpz.mod.ASURAN_FISTS_DMG, 350)
	end
end