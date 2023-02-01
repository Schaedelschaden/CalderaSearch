-----------------------------------------
-- ID: 21621
-- Equip: Naegling
-- Main Hand: "Savage Blade"
--            "Savage Blade Damage +15%"
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, item, param, caster)
    local mainHandID = target:getEquipID(tpz.slot.MAIN)

	if
        param      == tpz.itemCheck.EQUIP and
        mainHandID == 21621 -- Naegling
    then
		target:addMod(tpz.mod.ADDS_WEAPONSKILL, 42) -- Adds "Savage Blade"
        target:addMod(612, 15)                      -- "Savage Blade" Damage +15%
	end

	if
        param      == tpz.itemCheck.UNEQUIP and
        mainHandID == 21621 -- Naegling
    then
		target:delMod(tpz.mod.ADDS_WEAPONSKILL, 42) -- Adds "Savage Blade"
        target:delMod(612, 15)                      -- "Savage Blade" Damage +15%
	end
end
