-----------------------------------
-- Area: The Boyahda Tree
--   NM: Ancient Goobbue
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(tpz.mod.CRITHITRATE, 25)
end

function onMobSpawn(mob)
    mob:addStatusEffect(tpz.effect.HUNDRED_FISTS, 1, 0, 0)
    mob:addMod(tpz.mod.ACC, 750)
    mob:addMod(tpz.mod.REGEN, 1000)
    mob:addMod(tpz.mod.UDMGPHYS, -80)
    mob:addMod(tpz.mod.UDMGMAGIC, -80)
end

function onMobFight(mob, target)
    

end

function onMobDeath(mob, player, isKiller)
    player:addSpell(959, true, true) -- Abenzio
end

function onMobDespawn(mob)
    mob:setRespawnTime(3600) 
end
