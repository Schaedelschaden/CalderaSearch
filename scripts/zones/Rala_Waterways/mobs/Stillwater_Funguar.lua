-----------------------------------
-- Mob: Stillwater_Funguar
-----------------------------------
require("scripts/globals/status")
local ID = require("scripts/zones/Rala_Waterways/IDs")
-----------------------------------

function onMobSpawn(mob)
   mob:setDropID(math.random(3763, 3765))
end

function onMobFight(mob, target)
end


function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
    local rand = math.random(250, 750)
    player:addCurrency('bayld', rand)
    player:messageSpecial(ID.text.BAYLD_OBTAINED, rand)
    player:PrintToPlayer(string.format("Your Bayld Balance is %s", player:getCurrency('bayld')),tpz.msg.channel.SYSTEM_3)
end

