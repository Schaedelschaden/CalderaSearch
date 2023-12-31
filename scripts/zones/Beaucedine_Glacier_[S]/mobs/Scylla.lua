------------------------------
-- Area: Beaucedine Glacier [S]
--   NM: Scylla
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobSpawn(mob)
    mob:setMobLevel(118)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 539)
    player:addSpell(974, true, true) -- Leonyne
end
