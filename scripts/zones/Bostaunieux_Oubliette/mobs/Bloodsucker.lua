-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  Mob: Bloodsucker
-- Note: This script will be loaded for both the NM and non-NM mobs of this name.
-- !pos -21.776 16.983 -231.477 167
-----------------------------------
local ID = require("scripts/zones/Bostaunieux_Oubliette/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    if mob:getID() == ID.mob.BLOODSUCKER then
        mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1) -- "Has an Additional Effect of Drain on normal attacks"
        mob:setSpawn(-60.459, 17.009, -140.136)
        mob:setPos(-60.459, 17.009, -140.136, 0)
    end
end

function onAdditionalEffect(mob, target, damage)
    local dmg = 100

    return tpz.mob.onAddEffect(mob, target, dmg, tpz.mob.ae.HP_DRAIN, {chance = 100})
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 613, 1, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    if mob:getID() == ID.mob.BLOODSUCKER then
        -- UpdateNMSpawnPoint(mob)
        mob:setRespawnTime(3600)
        mob:setSpawn(-60.459, 17.009, -140.136)
    end
end
