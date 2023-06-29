-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Creek Sahagin
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
function onMobSpawn(mob)
    mob:setModelId(3005)
    mob:renameEntity("Jungle Cat")
    mob:setMobLevel(99)
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 127, 1, tpz.regime.type.FIELDS)
end
