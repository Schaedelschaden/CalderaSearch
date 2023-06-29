-----------------------------------
-- Area: Bearclaw Pinnacle
--  Mob: Mindertaur
--  ENM: Brothers
-----------------------------------
require("scripts/globals/status")
local ID = require("scripts/zones/Bearclaw_Pinnacle/IDs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(tpz.mod.SILENCERES, 75)
    mob:setMod(tpz.mod.DMGMAGIC, -10)
    mob:setMod(tpz.mod.SLEEPRES, 50)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ICE_ABSORB, 100)
	mob:addMod(tpz.mod.ICE_NULL, 100)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 20)
	mob:addMod(tpz.mod.TRIPLE_ATTACK, 7)
    mob:addMod(tpz.mod.SILENCERES, 35)
    mob:addMod(tpz.mod.STUNRES, 35)
    mob:addMod(tpz.mod.LULLABYRES, 35)
    mob:addMod(tpz.mod.SLEEPRES, 35)
    mob:addMod(tpz.mod.MACC, 100)
    mob:addMod(tpz.mod.REGEN, 200)
end

function onMobFight(mob, target)
    local brother = GetMobByID(mob:getID() + 1)  

end

function onMobDeath(mob, player, isKiller)
    player:addGil(math.random(150000, 500000) / 2)
end
