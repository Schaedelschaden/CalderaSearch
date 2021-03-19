-----------------------------------------
-- ID: 20856
-- Item: Phreatic Axe
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onItemCheck(target, itemCheck)
	local equipID = target:getEquipID(tpz.slot.MAIN)
	
	if (itemCheck == 1 and equipID == 20856) then --Equip
		target:addMod(tpz.mod.STEEL_CYCLONE_DMG, 450)
	end
	
	if (itemCheck == 2 and equipID == 20856) then -- Unequip
		target:delMod(tpz.mod.STEEL_CYCLONE_DMG, 450)
	end
end