-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Chloris
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.GUARD_PERCENT, 25)
	mob:setMod(tpz.mod.COUNTER, 25)
end

function onMobFight(mob, target)
	local hpp = mob:getHPP()
	
	if (hpp <= 75 and mob:getLocalVar("CHLORIS_2HR") == 0) then
		mob:useMobAbility(690)
		mob:setLocalVar("CHLORIS_2HR", 1)
	elseif (hpp <= 50 and mob:getLocalVar("CHLORIS_2HR") == 1) then
		mob:useMobAbility(690)
		mob:setLocalVar("CHLORIS_2HR", 2)
		if (math.random() <= 33) then
			mob:resetEnmity(target)
		end
	elseif (hpp <= 25 and mob:getLocalVar("CHLORIS_2HR") == 2) then
		mob:useMobAbility(690)
		mob:setLocalVar("CHLORIS_2HR", 3)
		mob:resetEnmity(target)
	end
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

	tpz.abyssea.kiOnMobDeath(mob, player)
end