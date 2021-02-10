-----------------------------------
-- Area: Ve'Lugannon Palace
-- NM: Steam Cleaner
-- Pos: 317 -1 361 177
-----------------------------------
function onMobSpawn(mob)
	mob:setMod(tpz.mod.REFRESH, 10)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.TP_DRAIN, {chance = 100, power = math.random(50, 120)})
end

function onMobDeath(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_SteamCleaner")
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_SteamCleaner", KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(6900, 7500)) -- 115-125 minutes
end