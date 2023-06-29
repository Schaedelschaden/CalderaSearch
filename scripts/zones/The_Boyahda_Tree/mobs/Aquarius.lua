-----------------------------------
-- Area: The Boyahda Tree
--   NM: Aquarius
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:setMobLevel(119)
    mob:setMod(tpz.mod.UDMGPHYS, -90)
    mob:setModelId(358)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENWATER)
end

function onMobFight(mob, target)
    mob:setMod(tpz.mod.UDMGPHYS, -90)
end

function onMobDeath(mob, player, isKiller)
    if player:getCharVar("MonberauxLvl") == 3 then
        player:setCharVar("MonberauxLvl", 4)
    end
end
