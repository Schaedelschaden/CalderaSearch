-----------------------------------
--  Mob: Sewer Syrup
-----------------------------------
local ID = require("scripts/zones/Bostaunieux_Oubliette/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobLevel(119)
    mob:setRespawnTime(3600)
end

function onAdditionalEffect(mob, target, damage)

end

function onMobFight(mob, target)
    mob:setMod(tpz.mod.UDMGPHYS, -80)
end

function onMobDeath(mob, player, isKiller)
    if player:getCharVar("MonberauxLvl") == 1 then
        player:setCharVar("MonberauxLvl", 2)
    end
    mob:setRespawnTime(3600)    
end

function onMobDespawn(mob)

end
