-----------------------------------------
-- ID: 25415
-- Equip: Republican Platinum Medal
-- Citizen of Bastok: "Regain" +2
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, item, itemCheck)
    local nation = target:getNation()

    --Equip
    if
        itemCheck == 1 and
        nation    == tpz.nation.BASTOK
    then
        target:addMod(tpz.mod.REGAIN, 2)
    end

    -- Unequip
    if
        itemCheck == 2 and
        nation    == tpz.nation.BASTOK
    then
        target:delMod(tpz.mod.REGAIN, 2)
    end
end
