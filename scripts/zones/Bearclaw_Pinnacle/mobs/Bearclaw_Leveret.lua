-----------------------------------
--  Area: Bearclaw Pinnacle
--  Mob: Bearclaw Leveret
--  ENM: Follow the White Rabbit
-----------------------------------
require("scripts/globals/status")
local ID = require("scripts/zones/Bearclaw_Pinnacle/IDs")
-----------------------------------

function onMobInitialize(mob)

end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ICE_ABSORB, 100)
	mob:addMod(tpz.mod.ICE_NULL, 100)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 25)
	mob:addMod(tpz.mod.TRIPLE_ATTACK, 10)
    mob:addMod(tpz.mod.SILENCERES, 35)
    mob:addMod(tpz.mod.STUNRES, 35)
    mob:addMod(tpz.mod.LULLABYRES, 100)
    mob:addMod(tpz.mod.SLEEPRES, 100)
    mob:addMod(tpz.mod.MACC, 100)
    mob:addMod(tpz.mod.REGEN, 100)
    mob:setMobLevel(119)
    
end

function onMobDeath(mob, player, isKiller)
    player:addGil(math.random(150000, 500000) / 5)
end