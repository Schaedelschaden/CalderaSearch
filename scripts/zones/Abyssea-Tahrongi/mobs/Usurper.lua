-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Usurper
-----------------------------------

function onMobSpawn(mob)
	mob:speed(90)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.FIRERES, 375)
	mob:setMod(tpz.mod.ICERES, 375)
	mob:setMod(tpz.mod.WINDRES, 375)
	mob:setMod(tpz.mod.EARTHRES, 375)
	mob:setMod(tpz.mod.THUNDERRES, 375)
	mob:setMod(tpz.mod.WATERRES, 375)
	mob:setMod(tpz.mod.LIGHTRES, 375)
	mob:setMod(tpz.mod.DARKRES, 375)
	mob:setMod(tpz.mod.REGAIN, 100)
	mob:addMod(tpz.mod.ACC, -75)
	mob:setMod(tpz.mod.CRITHITRATE, 75)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mob, skillID)
		if (math.random(1, 100) <= 35 and os.time() - mob:getLocalVar("MOBSKILL_RESET") > 10) then
			mob:useMobAbility()
			mob:setLocalVar("MOBSKILL_RESET", os.time())
		end
    end)

	mob:addListener("EFFECT_GAIN", "BLOOD_WEAPON_GAIN", function(mob, effect)
		if (effect:getType() == tpz.effect.BLOOD_WEAPON) then
			mob:setMod(tpz.mod.TRIPLE_ATTACK, 100)
		end
    end)
	
	mob:addListener("EFFECT_LOSE", "BLOOD_WEAPON_LOSE", function(mob, effect)
		if (effect:getType() == tpz.effect.BLOOD_WEAPON) then
			mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
		end
    end)
end

function onMobFight(mob)
	if (mob:getBattleTime() >= 180 and mob:getBattleTime() % 180 == 0) then
		mob:useMobAbility(695)
	end
end

function onMobDespawn(mob)
	mob:removeListener("MOBSKILL_USED")
	mob:removeListener("BLOOD_WEAPON_GAIN")
	mob:removeListener("BLOOD_WEAPON_LOSE")
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

	mob:removeListener("MOBSKILL_USED")
	mob:removeListener("BLOOD_WEAPON_GAIN")
	mob:removeListener("BLOOD_WEAPON_LOSE")
end