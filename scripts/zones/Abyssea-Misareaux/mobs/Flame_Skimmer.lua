-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Flame Skimmer
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.MOBMOD_MULTI_HIT, 3)
    mob:addMod(tpz.mod.BINDRES, 100)
    mob:addMod(tpz.mod.GRAVITYRES, 100)
    mob:addMod(tpz.mod.PARALYZERES, 100)
    mob:addMod(tpz.mod.SLEEPRES, 100)
    mob:addMod(tpz.mod.LULLABYRES, 100)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, 50)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        local mobHPP   = mob:getHPP()
        local limitHPP = mob:getLocalVar("EVA_LIMITER")

        if mobHPP <= 80 and limitHPP == 0 then
            mob:addMod(tpz.mod.EVA, 40)
            mob:setLocalVar("EVA_LIMITER", 1)
        elseif mobHPP <= 60 and limitHPP == 1 then
            mob:setMobMod(tpz.mobMod.MOBMOD_MULTI_HIT, 4)
            mob:addMod(tpz.mod.EVA, 40)
            mob:setLocalVar("EVA_LIMITER", 2)
        elseif mobHPP <= 40 and limitHPP == 2 then
            mob:setMobMod(tpz.mobMod.MOBMOD_MULTI_HIT, 5)
            mob:addMod(tpz.mod.EVA, 40)
            mob:setLocalVar("EVA_LIMITER", 3)
        elseif mobHPP <= 20 and limitHPP == 3 then
            mob:setMobMod(tpz.mobMod.MOBMOD_MULTI_HIT, 6)
            mob:addMod(tpz.mod.EVA, 40)
            mob:setLocalVar("EVA_LIMITER", 4)
        elseif mobHPP <= 10 and limitHPP == 4 then
            mob:addMod(tpz.mod.EVA, 40)
            mob:setLocalVar("EVA_LIMITER", 5)
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 3)
    end
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
