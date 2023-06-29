-----------------------------------
-- Area: Phomiuna_Aqueducts
--   NM: Tres Duendes
-----------------------------------
function onMobSpawn(mob)
    mob:setMobLevel(119)
    mob:setMod(tpz.mod.UDMGPHYS, -85)
end

function onMobFight(mob, target)
    mob:setMod(tpz.mod.UDMGPHYS, -80)
end

function onMobDeath(mob, player, isKiller)
    if player:getCharVar("MonberauxLvl") == 2 then
        player:setCharVar("MonberauxLvl", 3)
    end
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(75600, 86400)) -- 21 to 24 hours
end
