-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Mangy-tailed Marvin
-----------------------------------

function onMobSpawn(mob)
    -- mob:setMod(tpz.mod.HPP, 300)
	-- mob:setMod(tpz.mod.DMGPHYS, -50)
	-- mob:setMod(tpz.mod.DMGRANGE, -50)
	-- mob:setMod(tpz.mod.DMGMAGIC, -75)
	-- mob:addMod(tpz.mod.ACC, 300)
	-- mob:addMod(tpz.mod.MACC, 300)
	-- mob:addMod(tpz.mod.MEVA, 500)
	-- mob:addMod(tpz.mod.MDEF, 15)
	-- mob:addStatusEffect(tpz.effect.REGEN, 500, 3, 0)
	
	mob:setHP(999999999)
end

function onMobFight(mob)
	-- mob:setMod(tpz.mod.STUNRES, 10)
	-- mob:setMod(tpz.mod.MEVA, 1000)
end

function onMobDeath(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_MangyTailedMarvin")
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local message = ""
	local channel = 29
	local sysTime = 0
	
	KillCounter = KillCounter + 1
	
	if (KillCounter - 1 == 0) then
		message = string.format("%s has killed Mangy-tailed Marvin for the first time! The grudge begins...", playerName)
		SendServerMsg(playerName, channel, message)
	elseif (KillCounter == 10 or KillCounter == 25 or KillCounter == 50) then
		message = string.format("Marvin is taking this personally %s...%i times now?", playerName, KillCounter)
		SendServerMsg(playerName, channel, message)
	elseif (KillCounter == 100 or KillCounter == 200 or KillCounter == 300 or KillCounter == 400 or KillCounter == 500) then
		message = string.format("Marvin has ordered a hit on %s!", playerName)
		player:setCharVar("KillCounter_HitOrdered", 1)
		player:setCharVar("KillCounter_HitTimer", os.time() + 5)
		player:setCharVar("KillCounter_RaiseDelay", os.time() + 15)
		SendServerMsg(playerName, 7, message)
	else
		player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
	end
	
	player:addListener("TICK", "MARVIN_HIT_ORDERED", function(player)
		local hitOrdered = player:getCharVar("KillCounter_HitOrdered")
		local hitTimer = player:getCharVar("KillCounter_HitTimer")
		if (hitOrdered == 1 and os.time() > hitTimer) then
			player:injectActionPacket(4, 241)
			player:injectActionPacket(4, 280)
			player:setHP(0)
			player:setMP(0)
			player:setAnimation(0)
			
			player:removeListener("MARVIN_HIT_ORDERED")
		end
	end)
	
	player:addListener("TICK", "HIT_RAISE", function(player)
		local hitOrdered = player:getCharVar("KillCounter_HitOrdered")
		local raiseDelay = player:getCharVar("KillCounter_RaiseDelay")
		if (hitOrdered == 1 and os.time() > raiseDelay) then
			player:PrintToPlayer(string.format("Mangy-Tailed Marvin: Learned your lesson %s?!? I'll have mercy on you for now...", playerName), tpz.msg.channel.NS_LINKSHELL3)
			player:sendRaise(3)
			player:setCharVar("KillCounter_RaiseDelay", 0)
			player:setCharVar("KillCounter_HitOrdered", 0)
			player:setCharVar("KillCounter_HitTimer", 0)
			
			player:removeListener("HIT_RAISE")
		end
	end)
	
	if (player:getCharVar("KillCounter_HitOrdered") == 0) then
		player:removeListener("MARVIN_HIT_ORDERED")
		player:removeListener("HIT_RAISE")
	end
	
	player:setCharVar("KillCounter_MangyTailedMarvin", KillCounter)
end