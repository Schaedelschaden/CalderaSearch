-----------------------------------
-- Area: Bearclaw Pinnacle
--  Mob: Eldertaur
--  ENM: Brothers
-----------------------------------
require("scripts/globals/status")
local ID = require("scripts/zones/Bearclaw_Pinnacle/IDs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
    mob:setMod(tpz.mod.DMGMAGIC, -10)
    mob:setMod(tpz.mod.SLEEPRES, 75)
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
    mob:setDropID(0)
end

function onMobFight(mob, target)
    local brother = GetMobByID(mob:getID() + 1)
    
    if brother:isAlive() == true then
        mob:setMod(tpz.mod.UDMGRANGE, -100)
        mob:setMod(tpz.mod.UDMGMAGIC, -100)
        mob:setMod(tpz.mod.UDMGPHYS, -100)
        mob:setMod(tpz.mod.UDMGBREATH, -100)
        mob:setMod(tpz.mod.REGEN, 500)
    elseif brother:isAlive() == false then
        mob:setMod(tpz.mod.UDMGRANGE, 0)
        mob:setMod(tpz.mod.UDMGMAGIC, 0)
        mob:setMod(tpz.mod.UDMGPHYS, 0)
        mob:setMod(tpz.mod.UDMGBREATH, 0)
        mob:setMod(tpz.mod.REGEN, 0)
        mob:setDropID(3732)
    end
end


function onMobDeath(mob, player, isKiller)
    player:addGil(math.random(150000, 500000) / 2)
end
