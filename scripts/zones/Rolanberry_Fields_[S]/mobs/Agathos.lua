-----------------------------------
-- Area: Rolaberry Fields [S]
--   NM: Agathos
-----------------------------------
mixins = {require("scripts/mixins/families/amphiptere")}
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
	mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 100)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 50)
	mob:setMod(tpz.mod.PETRIFYRES, 100)
	mob:addMod(tpz.mod.ATT, 400)
	mob:addMod(tpz.mod.MATT, 100)
    mob:addMod(tpz.mod.ACC, 190)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.MACC, 200)
    mob:addMod(tpz.mod.EVA, 147)
	mob:addMod(tpz.mod.DEF, 600)
	-- mob:addMod(tpz.mod.VIT, 120)
	-- mob:addMod(tpz.mod.STR, 150)
	mob:addMod(tpz.mod.REGEN, 300)
	mob:setMod(tpz.mod.FAST_CAST, 15)
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
end