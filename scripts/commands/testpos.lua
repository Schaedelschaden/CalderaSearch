---------------------------------------------------------------------------------------------------
-- func: Teleports the target to -494, -7, 199 in zone 132 (Abyssea - La Theine)
-- desc: Sets the players position. If none is given, prints out the position instead.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-494, -7, 199, 136, 132) -- Abyssea - La Theine Rabbits
end
