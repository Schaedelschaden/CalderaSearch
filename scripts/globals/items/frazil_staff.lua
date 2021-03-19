-----------------------------------------
-- ID: 21167
-- Item: Frazil Staff
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onItemCheck(target, itemCheck)
	local equipID = target:getEquipID(tpz.slot.MAIN)
	
	if (itemCheck == 1 and equipID == 21167) then --Equip
		target:addMod(tpz.mod.EARTH_AFFINITY_PERP, -8)
	end
	
	if (itemCheck == 2 and equipID == 21167) then -- Unequip
		target:delMod(tpz.mod.EARTH_AFFINITY_PERP, -8)
	end
end