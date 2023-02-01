---------------------------------------------------------------------------------------------------
-- func: !useweaponskill
-- desc: Forces the target player, trust, or mob to use a weaponskill.
---------------------------------------------------------------------------------------------------
require("scripts/globals/msg")

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function onTrigger(player, wsid)
    local target = player:getCursorTarget()

    if wsid == 0 or wsid == nil then
        player:PrintToPlayer(string.format("You must specify a weaponskill!\n!useweaponskill <wsid>"), tpz.msg.channel.SYSTEM_3)

        return 0
    end

    -- Use weaponskill
    if
        target and
        not target:isNPC()
    then
        local mobTarget = target:getTarget()
        player:PrintToPlayer(string.format("Forcing %s to use weaponskill %i.", target:getName(), wsid), tpz.msg.channel.SYSTEM_3)

        target:useWeaponskill(wsid, mobTarget)
    else
        player:PrintToPlayer(string.format("You must target a player, trust, or mob first!"), tpz.msg.channel.SYSTEM_3)
    end
end
