---------------------------------------------------------------------------------------------------
-- func: !startevent <event>
-- desc: Activates the specified event for the user
---------------------------------------------------------------------------------------------------
require("scripts/globals/status");

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!startevent <number>")
end

function onTrigger(player, event)
    -- Validate speed amount
    if event == 0 or event == nil then
        error(player, "Invalid event specified.")
        return
    end

    player:startEvent(event)
end