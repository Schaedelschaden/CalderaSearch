-----------------------------------
-- Area: Sacrarium
--  Mob: Fomor's Avatar
-----------------------------------
mixins = {require("scripts/mixins/families/avatar")}

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ALWAYS_AGGRO, 1)
    mob:setUnkillable(false)
end

function onMobFight(mob, target)
    mob:setUnkillable(false)    
end

function onMobDeath(mob, player, isKiller)
end