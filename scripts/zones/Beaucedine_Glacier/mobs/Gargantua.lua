------------------------------
-- Area: Beaucedine Glacier
--   NM: Gargantua
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobSpawn(mob)
    mob:setDropID(3308)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 312)
end
