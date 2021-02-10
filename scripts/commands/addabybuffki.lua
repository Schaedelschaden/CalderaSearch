---------------------------------------------------------------------------------------------------
-- func: addabybuffki <player>
-- desc: Adds the Abyssea buff key items to the specified player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/keyitems")

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addabybuffki {player}")
end

function onTrigger(player, keyId, target)
    -- Validate target
    local targ
    if (target == nil) then
        targ = player
    else
        targ = GetPlayerByName(target)
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target))
            return
        end
    end

    -- Add key items to target
    local ID = zones[targ:getZoneID()]
	targ:addKeyItem(1430) -- Scarlet Abyssite of Furtherance
	targ:addKeyItem(1431) -- Sapphire Abyssite of Furtherance
	targ:addKeyItem(1432) -- Ivory Abyssite of Furtherance
    targ:addKeyItem(1433) -- Azure Abyssite of Merit
	targ:addKeyItem(1434) -- Viridian Abyssite of Merit
	targ:addKeyItem(1435) -- Jade Abyssite of Merit
	targ:addKeyItem(1436) -- Sapphire Abyssite of Merit
	targ:addKeyItem(1437) -- Ivory Abyssite of Merit
	targ:addKeyItem(1438) -- Indigo Abyssite of Merit
	player:PrintToPlayer(string.format("Added all Abyssea cruor buff KI's to %s.", targ:getName()))
end
