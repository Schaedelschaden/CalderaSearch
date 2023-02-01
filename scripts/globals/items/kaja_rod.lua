-----------------------------------------
-- ID: 22030
-- Equip: Kaja Rod
-- Main Hand: "Black Halo"
--            "Black Halo Damage +50%"
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, item, param, caster)
    local mainHandID = target:getEquipID(tpz.slot.MAIN)

	if
        param      == tpz.itemCheck.EQUIP and
        mainHandID == 22030 -- Kaja Rod
    then
		target:addMod(tpz.mod.ADDS_WEAPONSKILL, 169) -- Adds "Black Halo"
        target:addMod(739, 50)                       -- "Black Halo" Damage +50%
	end

	if
        param      == tpz.itemCheck.UNEQUIP and
        mainHandID == 22030 -- Kaja Rod
    then
		target:delMod(tpz.mod.ADDS_WEAPONSKILL, 169) -- Adds "Black Halo"
        target:delMod(739, 50)                       -- "Black Halo" Damage +50%
	end
end
