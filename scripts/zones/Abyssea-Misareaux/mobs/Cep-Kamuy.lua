-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Cep-Kamuy
-----------------------------------
mixins = {require("scripts/mixins/families/orobon")}
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ICERES, -50)
    mob:addMod(tpz.mod.THUNDERRES, -75)
    mob:addMod(tpz.mod.WATERRES, 75)
    mob:addMod(tpz.mod.SLEEPRES, 100)
    mob:addMod(tpz.mod.LULLABYRES, 100)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 60)
    mob:addMod(tpz.mod.CRITHITRATE, 25)
end

function onMobFight(mob, target)
    if mob:getHPP() <= 50 then
        mob:setMod(tpz.mod.REGAIN, 25)
    end
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
