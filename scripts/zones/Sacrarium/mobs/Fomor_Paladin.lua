-----------------------------------
-- Area: Sacrarium
--  Mob: Fomor Paladin
-----------------------------------
mixins = {require("scripts/mixins/fomor_hate")}

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ALWAYS_AGGRO, 1)
end

function onMobDeath(mob, player, isKiller)
end