-----------------------------------------
-- ID: 21480
-- Item: Blurred Crossbow
-- Additional Effect: Haste
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onItemCheck(target, itemCheck)
	if (itemCheck == 1) then --Equip
		target:addMod(tpz.mod.SNAP_SHOT, 15)
	end
	
	if (itemCheck == 2) then -- Unequip
		target:delMod(tpz.mod.SNAP_SHOT, 15)
	end
end