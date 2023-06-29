-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Kutharei
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:speed(90)
    mob:addMod(tpz.mod.BINDRES, 100)
    mob:addMod(tpz.mod.GRAVITYRES, 100)
    mob:addMod(tpz.mod.SLEEPRES, 100)
    mob:addMod(tpz.mod.STUNRES, 85)
    mob:addMod(tpz.mod.DMGMAGIC, -math.random(30, 50))
end

function onMobEngaged(mob, target)
end

function onMobFight(mob, target)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
