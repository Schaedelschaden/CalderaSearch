-----------------------------------------
-- ID: 21565
-- Equip: Tauret
-- Main Hand: "Evisceration"
--            "Evisceration Damage +50%"
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, item, param, caster)
    local mainHandID = target:getEquipID(tpz.slot.MAIN)

	if
        param      == tpz.itemCheck.EQUIP and
        mainHandID == 21565 -- Tauret
    then
		target:addMod(tpz.mod.ADDS_WEAPONSKILL, 25) -- Adds "Evisceration"
        target:addMod(595, 50)                      -- "Evisceration" Damage +50%
	end

	if
        param      == tpz.itemCheck.UNEQUIP and
        mainHandID == 21565 -- Tauret
    then
		target:delMod(tpz.mod.ADDS_WEAPONSKILL, 25) -- Adds "Evisceration"
        target:delMod(595, 50)                      -- "Evisceration" Damage +50%
	end
end
