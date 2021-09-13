-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Fistule
-----------------------------------

function onMobSpawn(mob)
	mob:untargetable(false)
	mob:setLocalVar("Fistule_PetSpawns", 0)
end

function onMobFight(mob)
	local isBusy = false
	
	if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or
	   act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true 
    end

	if (mob:getHPP() <= 83 and isBusy == false) then
		mob:useMobAbility(2514)
	elseif (mob:getHPP() <= 66 and isBusy == false) then
		mob:useMobAbility(2514)
	elseif (mob:getHPP() <= 49 and isBusy == false) then
		mob:useMobAbility(2514)
	elseif (mob:getHPP() <= 33 and isBusy == false) then
		mob:useMobAbility(2514)
	elseif (mob:getHPP() <= 16 and isBusy == false) then
		mob:useMobAbility(2514)
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