-----------------------------------
-- Area: Phanauet Channel (1)
--   NM: Aipaloovik
-- !pos -2.0 -3.0 9.6 1
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 25)
	mob:addMod(tpz.mod.TRIPLE_ATTACK, 10)
end

function onMobDeath(mob, player, isKiller)

    end
    
end


function onMobDespawn(mob)
    
end
