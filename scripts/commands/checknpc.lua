--------------------------------------------------------------
-- func: !checknpc
-- auth: Schaedel
-- desc: Check the targeted npc for useful information.
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!check <t>")
end

function onTrigger(player, npcId)
    -- validate npcId
    local targ
    if (npcId == nil) then
        targ = player:getCursorTarget()
        if (targ == nil or not targ:isNPC()) then
            error(player,"You must target a NPC.")
            return
        end
    else
        targ = GetNPCByID(mobId)
        if (targ == nil) then
            error(player,"Invalid npcID.")
            return
        end
    end

    -- Provide npc information.
	local Name = targ:getName()
	local fixedName = string.gsub(Name, "_", " ")
	local ID = targ:getID()
	local pos = targ:getPos()
	
    player:PrintToPlayer(string.format("NPC Name: %s  ID: %i  Position: %i, %i, %i", fixedName, ID, pos.x, pos.y, pos.z),tpz.msg.channel.SYSTEM_3)
end