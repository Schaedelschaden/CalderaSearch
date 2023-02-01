-----------------------------------------
-- ID: 25416
-- Equip: Sibyl Scarf
-- Citizen of Bastok: "Refresh" +1
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, item, itemCheck)
    local nation = target:getNation()

    --Equip
    if
        itemCheck == 1 and
        nation    == tpz.nation.WINDURST
    then
        target:addMod(tpz.mod.REFRESH, 1)
    end

    -- Unequip
    if
        itemCheck == 2 and
        nation    == tpz.nation.WINDURST
    then
        target:delMod(tpz.mod.REFRESH, 1)
    end
end
