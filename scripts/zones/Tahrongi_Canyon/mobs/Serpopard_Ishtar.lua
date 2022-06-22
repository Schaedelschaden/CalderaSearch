------------------------------
-- Area: Tahrongi Canyon
--   NM: Serpopard Ishtar
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobSpawn(mob)
	
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 257)
end