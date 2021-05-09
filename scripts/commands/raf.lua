---------------------------------------------------------------------------------------------------
-- func: !raf3 <player> <aug1> <v1> <aug2> <v2> <aug3> <v3> <aug4> <v4>
-- desc: Gives the Reforged Artifact set with augments to the specified player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 2,
    parameters = "siiiiiiii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!raf <player>")
end

function onTrigger(player, target, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val)
	local job = {tpz.job.WAR, tpz.job.MNK, tpz.job.WHM, tpz.job.BLM, tpz.job.RDM, tpz.job.THF, tpz.job.PLD, tpz.job.DRK, tpz.job.BST, tpz.job.BRD, tpz.job.RNG,
				 tpz.job.SAM, tpz.job.NIN, tpz.job.DRG, tpz.job.SMN, tpz.job.BLU, tpz.job.COR, tpz.job.PUP, tpz.job.DNC, tpz.job.SCH, tpz.job.GEO, tpz.job.RUN}
	local startingID = 27662
    local itemId = {}
	local amount = 1
	
	if (target == nil or itemId == nil) then
        error(player, "You must enter a valid player name.")
        return
    end

    local targ = GetPlayerByName( target )
	local mainJob = targ:getMainJob()
	
    if (targ == nil) then
        player:PrintToPlayer( string.format( "No target specified. Please provide a player name." ) )
        return
    end

    -- Load needed text ids for target's current zone
    local ID = zones[targ:getZoneID()]

    -- Attempt to give the target the items
    if (targ:getFreeSlotsCount() < 5) then
        targ:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId )
        player:PrintToPlayer( string.format( "%s does not have enough free space for that set! Please clear 5 inventory slots and try again.", target ) )
		targ:PrintToPlayer( string.format( "You do not have enough free space for that set! Please clear 5 inventory slots.") )
    else
		for i = 1, #job do
			if (mainJob == job[i] and mainJob < 19) then
				itemId[1] = startingID + job[i]
				itemId[2] = itemId[1] + 144
				itemId[3] = itemId[2] + 136
				itemId[4] = itemId[3] + 147
				itemId[5] = itemId[4] + 133
			end
			
			-- DNC has to be a pain in the ass with male and female versions of the gear
			if (mainJob == 19) then
				if (targ:getGender() == 1) then -- Male
					itemId[1] = 27681
					itemId[2] = itemId[1] + 144
					itemId[3] = itemId[2] + 136
					itemId[4] = itemId[3] + 147
					itemId[5] = itemId[4] + 133
				else -- Female
					itemId[1] = 27682
					itemId[2] = itemId[1] + 144
					itemId[3] = itemId[2] + 136
					itemId[4] = itemId[3] + 147
					itemId[5] = itemId[4] + 133
				end
			end
			
			if (mainJob == 20) then
				itemId[1] = 27683
				itemId[2] = itemId[1] + 144
				itemId[3] = itemId[2] + 136
				itemId[4] = itemId[3] + 147
				itemId[5] = itemId[4] + 133
			end
			
			-- GEO and RUN have different offsets
			if (mainJob == 21 or mainJob == 22) then
				startingID = 27765
				itemId[1] = startingID + targ:getMainJob()
				itemId[2] = itemId[1] + 140
				itemId[3] = itemId[2] + 140
				itemId[4] = itemId[3] + 140
				itemId[5] = itemId[4] + 140
			end
		end
		
		for v = 1, 5 do
			targ:addItem( itemId[v], amount, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val )
			targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId[v] )
		end
		
		local jobNameByNum = {}
		for k, v in pairs(tpz.job) do
			jobNameByNum[v] = k
		end
		
		player:PrintToPlayer( string.format( "Gave %s the %s Reforged Artifact NQ set.", target, jobNameByNum[mainJob] ) )
	end
end