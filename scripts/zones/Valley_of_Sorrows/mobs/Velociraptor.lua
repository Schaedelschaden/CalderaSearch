-----------------------------------
-- Area: Valley of Sorrows
--  Mob: Velociraptor
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
	-- mob:setRespawnTime(3600)
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 139, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 140, 1, tpz.regime.type.FIELDS)
end
