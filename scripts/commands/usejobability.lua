---------------------------------------------------------------------------------------------------
-- func: !usejobability
-- desc: Forces the target player, trust, or mob to use a job ability.
---------------------------------------------------------------------------------------------------
require("scripts/globals/msg")

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function onTrigger(player, abilityID)
    local target = player:getCursorTarget()

    if abilityID == 0 or abilityID == nil then
        player:PrintToPlayer(string.format("You must specify a job ability!\n!usejobability <ability #>"), tpz.msg.channel.SYSTEM_3)

        return 0
    end

    -- Use ability
    if
        target and
        not target:isNPC()
    then
        local mobTarget = target:getTarget()
        player:PrintToPlayer(string.format("Forcing %s to use ability %i.", target:getName(), abilityID), tpz.msg.channel.SYSTEM_3)

        target:useJobAbility(abilityID, target)
    else
        player:PrintToPlayer(string.format("You must target a player, trust, or mob first!"), tpz.msg.channel.SYSTEM_3)
    end
end
