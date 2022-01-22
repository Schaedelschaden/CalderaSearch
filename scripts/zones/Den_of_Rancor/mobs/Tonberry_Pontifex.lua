-----------------------------------
-- Area: Den of Rancor (160)
--   NM: Tonberry Pontifex
-- Mob ID: 17433003
-- !pos -209.5 11.9 -95.7 160
-----------------------------------
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.MATT, 0)
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 798, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 799, 2, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 800, 2, tpz.regime.type.GROUNDS)
	
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
    -- mob:setRespawnTime(math.random(75600, 86400)) -- 21 to 24 hours
end