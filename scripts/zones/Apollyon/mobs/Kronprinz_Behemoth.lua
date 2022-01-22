-----------------------------------
-- Area: Apollyon NW
--  Mob: Kronprinz Behemoth
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
local ID = require("scripts/zones/Apollyon/IDs")

function onMobRoam(mob)
	
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 60)
end

function onMobSpawn(mob)
	mob:setMod(tpz.mod.STUNRES, 80)
	mob:setMod(tpz.mod.SLEEPRES, 80)
end

function onMobDeath(mob, player, isKiller, noKiller)
	
end