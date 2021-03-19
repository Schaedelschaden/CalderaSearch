-----------------------------------------
-- ID: 21274
-- Item: Donar Gun
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onItemCheck(target, itemCheck)
	local equipID = target:getEquipID(tpz.slot.RANGED)
	
	if (itemCheck == 1 and equipID == 21274) then --Equip
		target:addMod(tpz.mod.BLAST_SHOT_DMG, 800)
	end
	
	if (itemCheck == 2 and equipID == 21274) then -- Unequip
		target:delMod(tpz.mod.BLAST_SHOT_DMG, 800)
	end
end