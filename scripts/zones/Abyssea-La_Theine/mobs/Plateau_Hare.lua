-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Plateau Hare
-----------------------------------

function onMobDeath(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_Rabbits")
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local message = ""
	local channel = 7
	local sysTime = 0
	
	KillCounter = KillCounter + 1
	
	if (KillCounter - 1 == 0) then
		player:PrintToPlayer(string.format("First %s kill! Beginning your counter...", fixedMobName), tpz.msg.channel.NS_LINKSHELL3)
	elseif (KillCounter == 100 or KillCounter == 500 or KillCounter == 1000 or KillCounter == 2500 or KillCounter == 5000 or KillCounter == 7500) then
		message = string.format("%s continues their kill streak! << %i rabbits! >>", playerName, KillCounter)
		SendServerMsg(playerName, channel, message)
	elseif (KillCounter == 10000 or KillCounter == 15000 or KillCounter == 20000 or KillCounter == 25000) then
		message = string.format("<< %i rabbits! >> When will the killing stop %s?!", KillCounter, playerName)
		SendServerMsg(playerName, channel, message)
	elseif (KillCounter > 25000) then
		message = string.format("The rabbits have ordered a hit on %s!", playerName)
		player:setCharVar("KillCounter_HitOrdered", 1)
		player:setCharVar("KillCounter_HitTimer", os.time() + 5)
		player:setCharVar("KillCounter_RaiseDelay", os.time() + 10)
		SendServerMsg(playerName, channel, message)
	else
		player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
	end
	
	player:addListener("TICK", "HIT_ORDERED", function(player)
		local hitOrdered = player:getCharVar("KillCounter_HitOrdered")
		local hitTimer = player:getCharVar("KillCounter_HitTimer")
		if (hitOrdered == 1 and os.time() > hitTimer) then
			KillPlayerByName(playerName)
			
			player:removeListener("HIT_ORDERED")
		end
	end)
	
	player:addListener("TICK", "HIT_RAISE", function(player)
		local raiseDelay = player:getCharVar("KillCounter_RaiseDelay")
		if (hitOrdered == 1 and os.time() > raiseDelay) then
			player:PrintToPlayer(string.format("Rabbit Conclave: Learned your lesson %s?!? We'll have mercy on you for now...", playerName), tpz.msg.channel.NS_LINKSHELL3)
			player:sendRaise(3)
			player:setCharVar("KillCounter_RaiseDelay", 0)
			player:setCharVar("KillCounter_HitOrdered", 0)
			player:setCharVar("KillCounter_HitTimer", 0)
			
			player:removeListener("HIT_RAISE")
		end
	end)
	
	player:setCharVar("KillCounter_Rabbits", KillCounter)
	
	if (mob:getMobFlags() < 4) then
		mob:setMobFlags(mob:getMobFlags() + 1, mob:getID())
	end
end