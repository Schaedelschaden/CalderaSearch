---------------------------------------------------------------------------------------------------
-- func: addtreasure <itemId> <target player/party/alliance>
-- desc: Adds an item directly to the treasure pool.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "isi"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addtreasure <itemID> {player} {npcID}")
end

function onTrigger(player, itemId, target, dropper)
	local treasure = {9084, 9084, 9084, 9085, 9085, 9085, 26949, 27286, 27553}

    local targ = player
	local dropper = GetNPCByID(player:getCursorTarget())

    -- add treasure to pool
	for i = 1, #treasure do
		if (math.random(100) <= 30) then
			targ:addTreasure(treasure[i], dropper)
		end
	end
end
