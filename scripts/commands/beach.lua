---------------------------------------------------------------------------------------------------
-- func: !beach
-- desc: Teleports the player to the Feretory (beach zone).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:setPos(-357, -2, -466, 190, 285)
end