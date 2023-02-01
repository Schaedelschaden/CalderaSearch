-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Ironclad Observer
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.STUNRES, 30)
    mob:addMod(tpz.mod.FASTCAST, 60)
end

function onMobFight(mob, target)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
