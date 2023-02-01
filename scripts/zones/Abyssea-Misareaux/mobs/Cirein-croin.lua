-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Cirein-croin
-----------------------------------
mixins = {require("scripts/mixins/families/orobon")}
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.SLEEPRES, 100)
    mob:addMod(tpz.mod.LULLABYRES, 100)
end

function onMobFight(mob, target)
    if mob:getHPP() > 50 then
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 889)
    elseif mob:getHPP() <= 50 then
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 890)
    end
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
