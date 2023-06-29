---------------------------------------------------------------------------------------------------
-- func: !fixvahzl
-- desc: Resets the position of the Teleport-Vahzl telepoint
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    local npc = GetNPCByID(17236309)

    npc:setPos(-451.252, -18.141, 451.976, 178, 54)
    npc:hideName(false)
    npc:untargetable(false)
    npc:setStatus(tpz.status.NORMAL)

    player:PrintToPlayer(string.format("Reset Medusa's spawn point."))
end
