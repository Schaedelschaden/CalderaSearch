-----------------------------------------
-- ID: 21036
-- Item: Atakigiri
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onItemCheck(target, itemCheck)
	local equipID = target:getEquipID(tpz.slot.MAIN)
	
	if (itemCheck == 1 and equipID == 21036) then --Equip
		target:addMod(tpz.mod.TACHI_KAGERO_DMG, 350)
	end
	
	if (itemCheck == 2 and equipID == 21036) then -- Unequip
		target:delMod(tpz.mod.TACHI_KAGERO_DMG, 350)
	end
end