-----------------------------------------
-- ID: 22031
-- Equip: Maxentius
-- Main Hand: "Black Halo"
--            "Black Halo Damage +50%"
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, item, param, caster)
    local mainHandID = target:getEquipID(tpz.slot.MAIN)

	if
        param      == tpz.itemCheck.EQUIP and
        mainHandID == 22031 -- Maxentius
    then
		target:addMod(tpz.mod.ADDS_WEAPONSKILL, 169) -- Adds "Black Halo"
        target:addMod(739, 50)                       -- "Black Halo" Damage +50%
	end

	if
        param      == tpz.itemCheck.UNEQUIP and
        mainHandID == 22031 -- Maxentius
    then
		target:delMod(tpz.mod.ADDS_WEAPONSKILL, 169) -- Adds "Black Halo"
        target:delMod(739, 50)                       -- "Black Halo" Damage +50%
	end
end
