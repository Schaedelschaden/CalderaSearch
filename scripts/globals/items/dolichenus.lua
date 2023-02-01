-----------------------------------------
-- ID: 21722
-- Equip: Dolichenus
-- Main Hand: "Decimation"
--            "Decimation Damage +120%"
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, item, param, caster)
    local mainHandID = target:getEquipID(tpz.slot.MAIN)

	if
        param      == tpz.itemCheck.EQUIP and
        mainHandID == 21722 -- Dolichenus
    then
		target:addMod(tpz.mod.ADDS_WEAPONSKILL, 72) -- Adds "Decimation"
        target:addMod(642, 120)                     -- "Decimation" Damage +120%
	end

	if
        param      == tpz.itemCheck.UNEQUIP and
        mainHandID == 21722 -- Dolichenus
    then
		target:delMod(tpz.mod.ADDS_WEAPONSKILL, 72) -- Adds "Decimation"
        target:delMod(642, 120)                     -- "Decimation" Damage +120%
	end
end
