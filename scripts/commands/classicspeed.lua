---------------------------------------------------------------------------------------------------
-- func: classicspeed
-- desc: Sets the players movement speed to retail for funsies.
---------------------------------------------------------------------------------------------------
require("scripts/globals/status");

cmdprops =
{
    permission = 0,
    parameters = "i"
}

function onTrigger(player)
    if player:speed() == 40 then
        player:PrintToPlayer(string.format("Caldera Speed Enabled"),tpz.msg.channel.SYSTEM_3)
        player:speed(80)
    elseif player:speed() > 40 then
        player:PrintToPlayer(string.format("Retail Speed Enabled"), tpz.msg.channel.SYSTEM_3)
        player:speed(40)
    end
end
