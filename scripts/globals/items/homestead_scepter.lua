-----------------------------------------
-- ID: 21172
-- Equip: Homestead Scepter
-- Adds MACC and Regain to avatars when in Sky/Sea/Besieged/Battlefields/Limbus
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

local zones =
{
    tpz.zone.RUAUN_GARDENS,
    tpz.zone.THE_SHRINE_OF_RUAVITAU,
    tpz.zone.VELUGANNON_PALACE,
    tpz.zone.ALTAIEU,
    tpz.zone.THE_GARDEN_OF_RUHMET,
    tpz.zone.GRAND_PALACE_OF_HUXZOI,
}

local statusEffects =
{
    tpz.effect.BATTLEFIELD,
    tpz.effect.BESIEGED,
}

function onItemCheck(target, param, caster)
    local latentActive = false
    local zoneID       = target:getZoneID()
    -- local pet          = target:getPet()

    for i = 1, #zones do
        if zoneID == zones[i] then
            latentActive = true
        end
    end

    for i = 1, #statusEffects do
        if target:hasStatusEffect(statusEffects[i]) then
            latentActive = true
        end
    end

    if
        latentActive == true and
        param == 1 -- Equip
    then
        target:addListener("TICK", "HOMESTEAD_SCEPTER_LATENT", function(playerArg)
            local playerPet = playerArg:getPet()

            if
                playerPet and
                playerPet:getLocalVar("HOMESTEAD_LATENT_APPLIED") == 0
            then
                playerPet:addMod(tpz.mod.MACC, 50)
                playerPet:addMod(tpz.mod.REGAIN, 100)
                playerPet:setLocalVar("HOMESTEAD_LATENT_APPLIED", 1)
            end
        end)
    end

    if
        latentActive == true and
        param == 2 -- Unequip
    then
        local pet = target:getPet()

        if
            pet and
            pet:getLocalVar("HOMESTEAD_LATENT_APPLIED") == 1
        then
            pet:delMod(tpz.mod.MACC, 50)
            pet:delMod(tpz.mod.REGAIN, 100)
            pet:setLocalVar("HOMESTEAD_LATENT_APPLIED", 0)
        end

        target:removeListener("HOMESTEAD_SCEPTER_LATENT")
    end
end
