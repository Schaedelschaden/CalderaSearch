-----------------------------------
-- Area: RuAun Gardens
--   NM: Despot
-----------------------------------
-- Despot will use Panzerfaust 2-3 times in a row every 30s regardless of his TP.

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
	mob:setMobMod(tpz.mobMod.DUAL_WIELD, 1)

    local ph = GetMobByID(mob:getLocalVar("ph"))
    if ph then
        local pos = ph:getPos()
        mob:setPos(pos.x, pos.y, pos.z, pos.r)
        local killerId = ph:getLocalVar("killer")
        if killerId ~= 0 then
            local killer = GetPlayerByID(killerId)
            if not killer:isEngaged() and killer:checkDistance(mob) <= 50 then
                mob:updateClaim(killer)
            end
        end
    end
end

function onMobRoam(mob)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
	local roamTime = mob:getLocalVar("roamTime")
	local pos = mob:getPos()
	
	if (os.time() - roamTime > 60) then
		mob:setPos(pos.x, pos.y, pos.z, pos.rot + 64) -- 64 (S), 128 (W), 192 (N), 256 (E)
        mob:setLocalVar("roamTime", os.time())
	end
end

function onMobFight(mob, target)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
	
	-- Uses Panzerfaust 2-3 times every 30 seconds
	if (mob:getBattleTime() > 0 and mob:getBattleTime() % 30 == 0) then
		mob:useMobAbility(536)
	end
end

function onMobDisengage(mob)
	local spawnPos = mob:getSpawnPos()
	mob:pathThrough({spawnPos.x, spawnPos.y, spawnPos.z})
end

function onMobWeaponSkill(target, mob, skill)
	
end

function onMobDeath(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_Despot")
	local playerName = player:getName()
	local mobName = mob:getName()
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_Despot", KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
    mob:removeListener("PH_VAR")
	mob:setRespawnTime(math.random(6900, 7500)) -- 115-125 minutes
end