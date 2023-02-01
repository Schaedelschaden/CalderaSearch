---------------------------------------------------------------------------------------------------
-- func: modelid
-- desc: prints model of cursor target into chatlog, for debugging.
---------------------------------------------------------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

cmdprops =
{
    permission = 1,
    parameters = ""
}

-- function onTrigger(player, extendedMode)
function onTrigger(player)
    local target = player:getCursorTarget()
    if target == nil then
        player:PrintToPlayer("Target something first.")
        return
    else
    player:PrintToPlayer(string.format("Model ID: %i ", target:getModelId()), tpz.msg.channel.SYSTEM_3)
    end
end
