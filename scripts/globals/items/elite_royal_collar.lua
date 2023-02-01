-----------------------------------------
-- ID: 25414
-- Equip: Elite Royal Collar
-- Citizen of San d'Oria: "Regen" +3
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, item, itemCheck)
    local nation = target:getNation()

    --Equip
    if
        itemCheck == 1 and
        nation    == tpz.nation.SANDORIA
    then
        target:addMod(tpz.mod.REGEN, 3)
    end

    -- Unequip
    if
        itemCheck == 2 and
        nation    == tpz.nation.SANDORIA
    then
        target:delMod(tpz.mod.REGEN, 3)
    end
end
