-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- Mob: Faust
-- Pos: 740 0 -100 178
-----------------------------------
-- Faust will use Typhoon 2-3 times in a row every 30s regardless of his TP.

function onMobSpawn(mob)
	mob:addMod(tpz.mod.ATT, 500)
	mob:setMod(tpz.mod.MOBMOD_TP_USE_CHANCE, 1000)
end

function onMobFight(mob, target)
	if (mob:getBattleTime() > 0 and mob:getBattleTime() % 30 == 0) then
		mob:useMobAbility(539)
	end
end

function onMobWeaponSkill(target, mob, skill)
	
end

function onMobDeath(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_Faust")
	local playerName = player:getName()
	local mobName = mob:getName()
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_Faust", KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(6900, 7500)) -- 115-125 minutes
end