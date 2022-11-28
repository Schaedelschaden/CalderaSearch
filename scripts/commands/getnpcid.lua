---------------------------------------------------------------------------------------------------
-- func: !getnpcid
-- desc: Get the ID for the NPC targeted by the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    local npc = player:getCursorTarget()

    if npc == nil or npc:getObjType() ~= tpz.objType.NPC then
        player:PrintToPlayer("You must select an NPC.")
        return
    else
        player:PrintToPlayer(string.format("NPC Name: [%s]  ID: [%i]", npc:getName(), npc:getID()))
    end
end
