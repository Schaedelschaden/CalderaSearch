-----------------------------------
-- Area: Beadeaux (147)
--   NM: Zo'Khu Blackcloud
-- Mob ID: 17379564
-- !pos -273 -3 -253 147
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/hunts")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.MATT, 30)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 242)
	
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local shortName = mobName:sub(1, 18)
	local KillCounter = player:getCharVar("KillCounter_"..shortName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..shortName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end