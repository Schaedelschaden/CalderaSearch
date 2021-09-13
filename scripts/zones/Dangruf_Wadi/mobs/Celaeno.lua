-----------------------------------
-- Area: Dangruf's Wadi
--  HNM: Celaeno
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 45)
	mob:addMod(tpz.mod.PARALYZERES, 50)
    mob:addMod(tpz.mod.STUNRES, 40)
    mob:addMod(tpz.mod.BINDRES, 50)
    mob:addMod(tpz.mod.SLOWRES, 50)
    mob:addMod(tpz.mod.SILENCERES, 80)
    mob:addMod(tpz.mod.SLEEPRES, 100)
    mob:addMod(tpz.mod.LULLABYRES, 100)
    mob:addMod(tpz.mod.PETRIFYRES, 80)
    mob:addMod(tpz.mod.POISONRES, 30)
	-- mob:addMod(tpz.mod.ATT, 700)
	mob:addMod(tpz.mod.MATT, 140)
	mob:addMod(tpz.mod.EVA, 150)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 10)
	mob:addMod(tpz.mod.REGEN, 200)
	mob:addMod(tpz.mod.REFRESH, 50)
end

function onMobFight(mob, target)
	
end

function onMobDespawn(mob)
	
end

function onMobDeath(mob, player, isKiller)
    
end