-----------------------------------------
-- ID: 21481
-- Item: Blurred Crossbow +1
-- Additional Effect: Snapshot
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onItemCheck(target, itemCheck)
	if (itemCheck == 1) then --Equip
		target:addMod(tpz.mod.SNAP_SHOT, 20)
	end
	
	if (itemCheck == 2) then -- Unequip
		target:delMod(tpz.mod.SNAP_SHOT, 20)
	end
end