---------------------------------------------------------------------------------------------------
-- func: !gilfarm
-- desc: Teleports the player to their choice of gil farming area.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
}

local zoneNames = 
{
    "Sea Serpent Grotto",
    "Castle Oztroja",
}

function onTrigger(player, option)
    local currentGil = player:getGil()

    if option == 0 or option == nil then
        player:PrintToPlayer("You must specify a gil farming area to be teleported to and have at least 50,000 gil.\n[1] Sea Serpent Grotto    [2] Castle Oztroja")
        return
    end

    if currentGil < 50000 then
        player:PrintToPlayer("This command costs 50,000 gil to use.")
        return
    else
        player:PrintToPlayer(string.format("Thank you for paying 50,000 gil. Teleporting to %s now.", zoneNames[option]))
        player:delGil(50000)

        if option == 1 then
            player:timer(1500, function(player)
                player:setPos(20.313, 20.000, -103.002, 101, 176)
            end)
        elseif option == 2 then
            player:timer(1500, function(player)
                player:setPos(-100.034, -71.750, -50.109, 66, 151)
            end)
        end
    end
end
