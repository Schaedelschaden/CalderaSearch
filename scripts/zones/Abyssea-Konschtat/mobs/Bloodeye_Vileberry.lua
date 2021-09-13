-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Bloodeye Vileberry
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.REFRESH, 20)
	mob:setMod(tpz.mod.MOVE, 100)
end

function onMobFight(mob)

end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end