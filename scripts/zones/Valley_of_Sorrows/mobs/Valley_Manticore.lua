-----------------------------------
-- Area: Valley of Sorrows
--  Mob: Valley Manticore
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
	-- mob:setRespawnTime(3600)
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 140, 2, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 141, 2, tpz.regime.type.FIELDS)
end
