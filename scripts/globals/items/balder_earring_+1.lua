-----------------------------------------
-- ID: 26115
-- Equip: Balder Earring +1
-- Adds +1% Quadruple Attack when worn in the Right Ear (Ear2)
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, itemCheck)
	local equipID = target:getEquipID(tpz.slot.EAR2)
	
	if (itemCheck == 1 and equipID == 26115) then --Equip
		target:addMod(tpz.mod.QUAD_ATTACK, 1)
	end
	
	if (itemCheck == 2 and equipID == 26115) then -- Unequip
		target:delMod(tpz.mod.QUAD_ATTACK, 1)
	end
end