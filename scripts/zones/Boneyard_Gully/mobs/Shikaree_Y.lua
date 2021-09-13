-----------------------------------
-- Area: Boneyard_Gully
--  Mob: Shikaree Y
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:addMod(tpz.mod.PETRIFYRES, 100) -- Resistance to Pertrify
	mob:addMod(tpz.mod.MATT, 50)
end

function onMobDeath(mob, player, isKiller)
end