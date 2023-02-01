-----------------------------------------
-- ID: 21921
-- Equip: Kaja Katana
-- Main Hand: "Blade: Ku"
--            "Blade: Ku Damage +60%"
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, item, param, caster)
    local mainHandID = target:getEquipID(tpz.slot.MAIN)

	if
        param      == tpz.itemCheck.EQUIP and
        mainHandID == 21921 -- Kaja Katana
    then
		target:addMod(tpz.mod.ADDS_WEAPONSKILL, 136) -- Adds "Blade: Ku"
        target:addMod(706, 60)                      -- "Blade: Ku" Damage +60%
	end

	if
        param      == tpz.itemCheck.UNEQUIP and
        mainHandID == 21921 -- Kaja Katana
    then
		target:delMod(tpz.mod.ADDS_WEAPONSKILL, 136) -- Adds "Blade: Ku"
        target:delMod(706, 60)                      -- "Blade: Ku" Damage +60%
	end
end
