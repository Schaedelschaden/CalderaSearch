-----------------------------------
-- Area: Attohwa Chasm
--  Mob: Air Elemental
-----------------------------------
local ID = require("scripts/zones/Attohwa_Chasm/IDs")
require("scripts/globals/mobs")

function onMobSpawn(mob)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.MATT, 90)	
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end
