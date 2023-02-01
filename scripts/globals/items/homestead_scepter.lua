-----------------------------------------
-- ID: 21172
-- Equip: Homestead Scepter
-- Adds MACC and Regain to avatars when in Sky/Sea/Besieged/Battlefields/Limbus
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, itemCheck, caster)
    local zoneID = caster:getZoneID()

    if
        zoneID == 130 or -- Ru'Aun Gardens
        zoneID == 178 or -- The Shrine of Ru'Avitau
        zoneID == 177 or -- Ve'Lugannon Palace
        zoneID == 33  or -- Al'Taieu
        zoneID == 35  or -- The Garden of Ru'Hmet
        zoneID == 34  or -- Grand Palace of Hu'Xzoi
        caster:hasStatusEffect(tpz.effect.BESIEGED) or
        caster:hasStatusEffect(tpz.effect.BATTLEFIELD)
    then
        if itemCheck == 1 and caster:getPet() then --Equip
            local pet = caster:getPet()

            pet:addMod(tpz.mod.MACC, 50)
            pet:addMod(tpz.mod.REGAIN, 100)
        end

        if itemCheck == 2 and caster:getPet() then -- Unequip
            local pet = caster:getPet()

            pet:addMod(tpz.mod.MACC, 50)
            pet:addMod(tpz.mod.REGAIN, 100)
        end
    end
end
