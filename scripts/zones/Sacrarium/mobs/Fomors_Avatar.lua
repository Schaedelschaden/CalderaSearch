-----------------------------------
-- Area: Sacrarium
--  Mob: Fomor's Avatar
-----------------------------------
mixins = {require("scripts/mixins/families/avatar")}

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ALWAYS_AGGRO, 1)
    
end

function onMobDeath(mob, player, isKiller)
end