-----------------------------------
-- Area: Valley of Sorrows
--  Mob: Peryton
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
	-- mob:setRespawnTime(3600)
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 139, 2, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 141, 1, tpz.regime.type.FIELDS)
end
