-----------------------------------------
-- ID: 26114
-- Equip: Balder Earring
-- Adds +1% Triple Attack when worn in the Right Ear (Ear2)
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, itemCheck)
	local equipID = target:getEquipID(tpz.slot.EAR2)
	
	if (itemCheck == 1 and equipID == 26114) then --Equip
		target:addMod(tpz.mod.TRIPLE_ATTACK, 1)
	end
	
	if (itemCheck == 2 and equipID == 26114) then -- Unequip
		target:delMod(tpz.mod.TRIPLE_ATTACK, 1)
	end
end