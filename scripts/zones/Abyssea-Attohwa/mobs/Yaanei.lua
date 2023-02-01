-----------------------------------
-- Area: Abyssea-Attohwa
--   NM: Yaanei
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.STUNRES, 90)
    mob:addMod(tpz.mod.PARALYZERES, 65)
    mob:addMod(tpz.mod.DEF, 1000)
end

function onMobFight(mob, target)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
