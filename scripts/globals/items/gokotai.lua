-----------------------------------------
-- ID: 21922
-- Equip: Gokotai
-- Main Hand: "Blade: Ku"
--            "Blade: Ku Damage +60%"
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, item, param, caster)
    local mainHandID = target:getEquipID(tpz.slot.MAIN)

	if
        param      == tpz.itemCheck.EQUIP and
        mainHandID == 21922 -- Gokotai
    then
		target:addMod(tpz.mod.ADDS_WEAPONSKILL, 136) -- Adds "Blade: Ku"
        target:addMod(706, 60)                      -- "Blade: Ku" Damage +60%
	end

	if
        param      == tpz.itemCheck.UNEQUIP and
        mainHandID == 21922 -- Gokotai
    then
		target:delMod(tpz.mod.ADDS_WEAPONSKILL, 136) -- Adds "Blade: Ku"
        target:delMod(706, 60)                      -- "Blade: Ku" Damage +60%
	end
end
