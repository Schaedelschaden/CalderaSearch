---------------------------------------------------------
-- Voidwatch
---------------------------------------------------------
require("scripts/globals/utils")
-----------------------------------

tpz = tpz or {}
tpz.voidwatch = tpz.voidwatch or {}

tpz.voidwatch.onTriggerCaldera = function(player, npc)
    local ID      = zones[player:getZoneID()]
    local kcKirin = player:getCharVar("KillCounter_Kirin")
	local kcJoL   = player:getCharVar("KillCounter_JailOfLove")

    -- Gate receiving a voidstone to players that have killed Kirin and Jailer of Love
	if kcKirin > 0 and kcJoL > 0 then
        -- Check how many voidstones would be available to claim
        -- local lastStone     = player:getCharVar("Voidwatch_Timer")
        -- local currentStones = player:getCharVar("Voidstones_Avail")
        -- local currentTime   = os.time()
        -- local multiStones   = (currentTime - lastStone) / 43200

        -- -- Check current stones stored
        -- -- When current stones stored are less than 4 check stones available from last claim and refill stones available

        -- if multiStones > 0 then
            -- currentStones = currentStones + utils.clamp(multiStones, 0, 4)
        -- end

        -- player:PrintToPlayer(string.format("Voidwatch Officer : Looks like there are %i stones available to claim.", currentStones),tpz.msg.channel.NS_SAY)

        -- -- Check the last time a stone was claimed against the current time
        -- if currentTime - lastStone > 43200 then
            -- multiStones = (currentTime - lastStone) / 43200
            -- printf("voidwatch.lua onTriggerCaldera  TIME: [%i]  STONES AVAILABLE: [%i]", currentTime - lastStone, multiStones)

            -- if multiStones > 4 then
                -- multiStones = 4
            -- end
        -- end

		if os.time() - player:getCharVar("Voidwatch_Timer") >= 0 and not player:hasKeyItem(tpz.ki.VOIDSTONE1) then
			player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.VOIDSTONE1)
			player:addKeyItem(tpz.ki.VOIDSTONE1)
			player:setCharVar("Voidwatch_Timer", os.time() + 43200)
			player:PrintToPlayer(string.format("Voidwatch Officer : Take yer stone and get outta here!"),tpz.msg.channel.NS_SAY)
		elseif player:hasKeyItem(tpz.ki.VOIDSTONE1) then
			player:PrintToPlayer(string.format("Voidwatch Officer : You've already got a Voidstone and I'm not giving you another! It's very dangerous if the stones touch!"),tpz.msg.channel.NS_SAY)
		else
			local timeRemaining = (player:getCharVar("Voidwatch_Timer") - os.time()) / 60

			if timeRemaining <= 60 then
				player:PrintToPlayer(string.format("Voidwatch Officer : I've got nothing for yer greedy arse! Come back in %i minutes.", timeRemaining),tpz.msg.channel.NS_SAY)
			else
				timeRemaining = timeRemaining / 60
				player:PrintToPlayer(string.format("Voidwatch Officer : I've got nothing for yer greedy arse! Come back in %i hours.", timeRemaining),tpz.msg.channel.NS_SAY)
			end
		end
	else
		player:PrintToPlayer(string.format("Voidwatch Officer : You gotta defeat both Kirin and the Jailer of Love before you'll be strong enough to fight these monsters!", timeRemaining),tpz.msg.channel.NS_SAY)
	end
end
