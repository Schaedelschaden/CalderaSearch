-----------------------------------
-- Area: Cirdas Caverns ()
--  Mob: Crepuscular Worm
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobFight(mob, target)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
	mob:hideName(false)
    mob:untargetable(false)
end

function onMobDisengage(mob)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobDeath(mob, player, isKiller)
    
end