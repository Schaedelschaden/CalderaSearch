-----------------------------------
-- Area: Battalia Downs [S]
--  NPC: Voidwatch Officer
-- Issues voidstones
-----------------------------------
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Batallia_Downs_[S]/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
	local kirinKills = player:getCharVar("KillCounter_Kirin")
	local jolKills = player:getCharVar("KillCounter_JailOfLove")

	if (kirinKills > 0 and jolKills > 0) then
		if (os.time() - player:getCharVar("Voidwatch_Timer") >= 0 and not player:hasKeyItem(tpz.ki.VOIDSTONE1)) then
			player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.VOIDSTONE1)
			player:addKeyItem(tpz.ki.VOIDSTONE1)
			player:setCharVar("Voidwatch_Timer", os.time() + 43200)
			player:PrintToPlayer(string.format("Voidwatch Officer : Take yer stone and get outta here!"),tpz.msg.channel.NS_SAY)
		elseif (player:hasKeyItem(tpz.ki.VOIDSTONE1)) then
			player:PrintToPlayer(string.format("Voidwatch Officer : You've already got a Voidstone and I'm not giving you another! It's very dangerous if the stones touch!"),tpz.msg.channel.NS_SAY)
		else
			local timeRemaining = (player:getCharVar("Voidwatch_Timer") - os.time()) / 60
			
			if (timeRemaining <= 60) then
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

function onEventUpdate(player, csid, option)
	
end

function onEventFinish(player, csid, option)
	
end