-----------------------------------
-- Area: Rala Waterways
--  Mob: Barnacle Crab
-----------------------------------
require("scripts/globals/status")
local ID = require("scripts/zones/Rala_Waterways/IDs")
-----------------------------------

function onMobSpawn(mob)
   mob:setDropID(math.random(3763, 3765))
end

function onMobFight(mob, target)
    mob:setMod(tpz.mod.UDMGPHYS, -25)                        
    mob:setMod(tpz.mod.UDMGBREATH, -25)                      
    mob:setMod(tpz.mod.UDMGMAGIC, -25)                       
    mob:setMod(tpz.mod.UDMGRANGE, -25)     
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
    local rand = math.random(250, 750)
    player:addCurrency('bayld', rand)
    player:messageSpecial(ID.text.BAYLD_OBTAINED, rand)
    player:PrintToPlayer(string.format("Your Bayld Balance is %s", player:getCurrency('bayld')),tpz.msg.channel.SYSTEM_3)
end

