-----------------------------------------
-- ID: 20808
-- Item: Tramontane Axe
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onItemCheck(target, itemCheck)
	local equipID = target:getEquipID(tpz.slot.MAIN)
	
	if (itemCheck == 1 and equipID == 20808) then --Equip
		target:addMod(tpz.mod.CLOUDSPLITTER_DMG, 300)
	end
	
	if (itemCheck == 2 and equipID == 20808) then -- Unequip
		target:delMod(tpz.mod.CLOUDSPLITTER_DMG, 300)
	end
end